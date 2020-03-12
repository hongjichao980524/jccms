@if ($paginator->hasPages())
    <div class="layui-laypage">
        {{-- Previous Page Link --}}
        @if ($paginator->onFirstPage())
            <a class="layui-laypage-prev layui-disabled" aria-label="@lang('pagination.previous')">
                上页
            </a>
        @else
            <a class="layui-laypage-prev" href="{{ $paginator->previousPageUrl() }}" rel="prev"
               aria-label="@lang('pagination.previous')">上页</a>
        @endif

        @if($paginator->currentPage() > 3)
            <a href="{{ $paginator->url(1) }}">1</a>
        @endif

        @if($paginator->currentPage() > 4)
            <a href="javascript:;">...</a>
        @endif

        {{-- Pagination Elements --}}
        @foreach ($elements as $element)

            {{-- Array Of Links --}}
            @if (is_array($element))
                @foreach ($element as $page => $url)
                    @if($page >= $paginator->currentPage() - 2 && $page <= $paginator->currentPage() + 2)
                        @if ($page == $paginator->currentPage())
                            <span class="layui-laypage-curr"><em
                                        class="layui-laypage-em"></em><em>{{ $page }}</em></span>
                        @else
                            <a href="{{ $url }}">{{ $page }}</a>
                        @endif
                    @endif
                @endforeach
            @endif
        @endforeach

        @if($paginator->currentPage() < $paginator->lastPage() - 3)
            <a href="javascript:;">...</a>
        @endif

        @if($paginator->currentPage() < $paginator->lastPage() - 2)
            <a href="{{ $paginator->url($paginator->lastPage()) }}">{{ $paginator->lastPage() }}</a>
        @endif

        {{-- Next Page Link --}}
        @if ($paginator->hasMorePages())
            <a class="layui-laypage-next" href="{{ $paginator->nextPageUrl() }}" rel="next"
               aria-label="@lang('pagination.next')">下页</a>
        @else
            <a class="layui-laypage-next layui-disabled" aria-label="@lang('pagination.next')">
                下页
            </a>
        @endif
    </div>

@endif
