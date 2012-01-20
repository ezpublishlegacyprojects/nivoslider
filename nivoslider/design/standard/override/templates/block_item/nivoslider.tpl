<div class="class-nivoslider float-break">
    
    {def $classes = array( 'nivoslider_image' )}
    {def $children_count=fetch_alias( 'children_count', hash( 'parent_node_id',$node.node_id,
                                                            'class_filter_type', 'include',
                                                            'class_filter_array', $classes ) )}
    {if gt($children_count,0)}
        {def $whs=fetch_alias( 'children', hash( 'parent_node_id',$node.node_id,
                                                          'sort_by', $node.sort_array,
                                                          'class_filter_type', 'include',
                                                          'class_filter_array', $classes,
                                                          'limit', 1) ) }
        {foreach $whs as $wh }
        <style type="text/css">
            #slider {ldelim}                  
                width:{$wh.data_map.image.content[nivoslider_block_item].width}px;
                height:{$wh.data_map.image.content[nivoslider_block_item].height}px;
            {rdelim}
        </style>
        {/foreach}     
            <div id="slider">           
            {def $children=fetch_alias( 'children', hash( 'parent_node_id',$node.node_id,
                                                          'sort_by', $node.sort_array,
                                                          'class_filter_type', 'include',
                                                          'class_filter_array', $classes ) ) }
            
            {def $i=0}
            {foreach $children as $child }
                {if $child.data_map.url.content|ne("")}<a href="{$child.data_map.url.content}">{/if}
                <img width="{$child.data_map.image.content[nivoslider_block_item].width}"
                     height="{$child.data_map.image.content[nivoslider_block_item].height}"
                     alt=""
                     {if $child.data_map.image.content.alternative_text|ne("")}title="#htmlcaption{$i}"{/if}
                    {*$child.data_map.image.content[nivoslider_full].url|ezurl('no','full')*}
                    src="{$child.data_map.image.content.nivoslider_embed.full_path} />
                {if $child.data_map.url.content|ne("")}</a>{/if}
                    
                {if $child.data_map.image.content.alternative_text|ne("")}
                    <div id="htmlcaption{$i}" class="nivo-html-caption">
                        {$child.data_map.image.content.alternative_text}    
                    </div>
                    {set $i=inc( $i )}
                {/if}       
            {/foreach}
        </div>
    {/if}   

    <script type="text/javascript">
        $(window).load(function() {ldelim}
            $('#slider').nivoSlider(
                {ldelim}
                effect : '{attribute_view_gui attribute=$node.data_map.effect}',       
                slices : {attribute_view_gui attribute=$node.data_map.slices},
                boxCols : {attribute_view_gui attribute=$node.data_map.boxcols},
                boxRows : {attribute_view_gui attribute=$node.data_map.boxrows},
                animSpeed : {attribute_view_gui attribute=$node.data_map.animspeed},
                pauseTime : {attribute_view_gui attribute=$node.data_map.pausetime},
                directionNav : {if $node.data_map.directionnav.content}true{else}false{/if}, 
                directionNavHide : {if $node.data_map.directionnavhide.content}true{else}false{/if}, 
                controlNav : false,
                controlNavThumbs:false,
                controlNavThumbsFromRel:false,
                {*controlNavThumbsSearch: '.jpg', *}
                {*controlNavThumbsReplace: '_thumb.jpg',*}
                keyboardNav : {if $node.data_map.keyboardnav.content}true{else}false{/if}, 
                pauseOnHover : {if $node.data_map.pauseonhover.content}true{else}false{/if}, 
                manualAdvance : {if $node.data_map.manualadvance.content}true{else}false{/if}, 
                captionOpacity : {attribute_view_gui attribute=$node.data_map.captionopacity},
                prevText : '{$node.data_map.prevtext.content}',
                nextText : '{$node.data_map.nexttext.content}',
                randomStart : {if $node.data_map.randomstart.content}true{else}false{/if}
                {*
                ,
                afterChange: function(){}, // Triggers after a slide transition
                slideshowEnd: function(){}, // Triggers after all slides have been shown
                lastSlide: function(){}, // Triggers when last slide is shown
                afterLoad: function(){} // Triggers when slider has loaded
                *}
                {rdelim}                
            );
        {rdelim});
    </script>
    
</div>

