{* NivoSlider - Embed view *}
<div class="content-view-embed">
    <div class="class-nivoslider">
        {def $classes = array( 'nivoslider_image' )}
        {def $children_count=fetch_alias( 'children_count', hash( 'parent_node_id',$object.main_node_id,
                                                                'class_filter_type', 'include',
                                                                'class_filter_array', $classes ) )}
        {if gt($children_count,0)}
            {def $whs=fetch_alias( 'children', hash( 'parent_node_id',$object.main_node_id,
                                                              'sort_by', $object.sort_array,
                                                              'class_filter_type', 'include',
                                                              'class_filter_array', $classes,
                                                              'limit', 1) ) }
            {foreach $whs as $wh }
            <style type="text/css">
                #slider {ldelim}                  
                    width:{$wh.data_map.image.content[nivoslider].width}px;
                    height:{$wh.data_map.image.content[nivoslider].height}px;
                {rdelim}
            </style>
            {/foreach}     
                <div id="slider">           
                {def $children=fetch_alias( 'children', hash( 'parent_node_id',$object.main_node_id,
                                                              'sort_by', $object.sort_array,
                                                              'class_filter_type', 'include',
                                                              'class_filter_array', $classes ) ) }
                
                {def $i=0}
                {foreach $children as $child }
                    {if $child.data_map.url.content|ne("")}<a href="{$child.data_map.url.content}">{/if}
                    <img width="{$child.data_map.image.content[nivoslider].width}"
                         height="{$child.data_map.image.content[nivoslider].height}"
                         alt=""
                         {if $child.data_map.image.content.alternative_text|ne("")}title="#htmlcaption{$i}"{/if}
                         src="{$child.data_map.image.content[nivoslider].url|ezurl(,'full')}" />
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
                    effect : '{attribute_view_gui attribute=$object.data_map.effect}',
                    slices : {attribute_view_gui attribute=$object.data_map.slices},
                    boxCols : {attribute_view_gui attribute=$object.data_map.boxcols},
                    boxRows : {attribute_view_gui attribute=$object.data_map.boxrows},
                    animSpeed : {attribute_view_gui attribute=$object.data_map.animspeed},
                    pauseTime : {attribute_view_gui attribute=$object.data_map.pausetime},
                    directionNav : {if $object.data_map.directionnav.content}true{else}false{/if}, 
                    directionNavHide : {if $object.data_map.directionnavhide.content}true{else}false{/if}, 
                    controlNav : false,
                    controlNavThumbs:false,
                    controlNavThumbsFromRel:false,
                    keyboardNav : {if $object.data_map.keyboardnav.content}true{else}false{/if}, 
                    pauseOnHover : {if $object.data_map.pauseonhover.content}true{else}false{/if}, 
                    manualAdvance : {if $object.data_map.manualadvance.content}true{else}false{/if}, 
                    captionOpacity : {attribute_view_gui attribute=$object.data_map.captionopacity}
                    {rdelim}                
                );
            {rdelim});
        </script>
    </div>
</div>           