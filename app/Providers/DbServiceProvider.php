<?php

namespace App\Providers;

use Illuminate\Database\Query\Builder as QueryBuilder;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\DB;

class DbServiceProvider extends ServiceProvider
{

    public function boot()
    {
        /*测试
        QueryBuilder::macro('aaa',function(){
            return 'aaa';
        });*/
        //拓展单条数据查询方法 结果为数组
        QueryBuilder::macro('myfind',function(){
            $res = $this->first();
            return $res?(array)$res:false;
        });
        //拓展列表查询方法 结果为数组
        QueryBuilder::macro('mylists',function(){
            $tmp = $this->get()->all();
            $res = [];
            foreach ($tmp as $key => $value) {
                $res[] = (array)$value;
            }
            return $res;
        });

        //拓展自定义索引列表查询方法 结果为数组
        QueryBuilder::macro('mycates',function($index){
            $res = $this->mylists();
            $lists = [];
            foreach ($res as $key => $value) {
                $lists[$value[$index]] = $value;
            }
            return $lists;
        });

        //拓展分页方法
        QueryBuilder::macro('mypages',function($pageSize = 12,$_appends=[]){
            $pageObj = $this->paginate($pageSize);
            $items = $pageObj->items();
            $temp = [];
            foreach($items as $item){
                $temp[] = (array)$item;
            }
            //列表
            $res['lists'] = $temp;
            //总数
            $res['total'] = $pageObj->total();
            //有查询条件时
            if($_appends){
                $pageObj = $pageObj->appends($_appends);
            }
            //分页
            $res['links'] = $pageObj->links('Admins.public.paginate');

            return $res;
        });
    }
}