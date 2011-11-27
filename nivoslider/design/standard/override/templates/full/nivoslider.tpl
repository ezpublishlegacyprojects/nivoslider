{* NivoSlider - Full view *}
<div class="border-box">
    <div class="border-tl"><div class="border-tr"><div class="border-tc"></div></div></div>
    <div class="border-ml"><div class="border-mr"><div class="border-mc float-break">
    
    <div class="content-view-full">
        <div class="class-{$node.object.class_identifier}">
            
            <div class="attribute-header">
                <h1>{$node.name|wash()}</h1>
            </div>
            
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
                        width:{$wh.data_map.image.content[nivoslider_full].width}px;
                        height:{$wh.data_map.image.content[nivoslider_full].height}px;
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
                        <img width="{$child.data_map.image.content[nivoslider_full].width}"
                             height="{$child.data_map.image.content[nivoslider_full].height}"
                             alt=""
                             {if $child.data_map.image.content.alternative_text|ne("")}title="#htmlcaption{$i}"{/if}
                             src="{$child.data_map.image.content[nivoslider_full].url|ezurl('no','full')}" />
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
    </div>
    </div></div></div>
    <div class="border-bl"><div class="border-br"><div class="border-bc"></div></div></div>
</div>
