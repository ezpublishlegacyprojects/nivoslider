{* NivoSlider - Embed view *}
{ezscript_require('ezjsc::jquery')}
{ezscript_require('jquery.nivo.slider.pack.js')}
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
                    width:{$wh.data_map.image.content[nivoslider_embed].width}px;
                    height:{$wh.data_map.image.content[nivoslider_embed].height}px;
                {rdelim}
            </style>
            {/foreach}     
                <div id="slider_{$object.main_node_id}">           
                {def $children=fetch_alias( 'children', hash( 'parent_node_id',$object.main_node_id,
                                                              'sort_by', $object.sort_array,
                                                              'class_filter_type', 'include',
                                                              'class_filter_array', $classes ) ) }
                
                {def $i=0}
                {foreach $children as $child }
                    {if $child.data_map.url.content|ne("")}<a href="{$child.data_map.url.content}">{/if}
                    <img width="{$child.data_map.image.content[nivoslider_embed].width}"
                         height="{$child.data_map.image.content[nivoslider_embed].height}"
                         alt=""
                         {if $child.data_map.image.content.alternative_text|ne("")}title="#htmlcaption{$i}"{/if}
                        {*$child.data_map.image.content[nivoslider_full].url|ezurl('no','full')*}
                        src="{$child.data_map.image.content.nivoslider_embed.full_path}" />
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
            //<![CDATA[
            jQuery(document).ready(function($){ldelim}
                $('#slider_{$object.main_node_id}').nivoSlider(
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
                    {*controlNavThumbsSearch: '.jpg', *}
                    {*controlNavThumbsReplace: '_thumb.jpg',*}
                    keyboardNav : {if $object.data_map.keyboardnav.content}true{else}false{/if}, 
                    pauseOnHover : {if $object.data_map.pauseonhover.content}true{else}false{/if}, 
                    manualAdvance : {if $object.data_map.manualadvance.content}true{else}false{/if}, 
                    captionOpacity : {attribute_view_gui attribute=$object.data_map.captionopacity},
                    prevText : '{$object.data_map.prevtext.content}',
                    nextText : '{$object.data_map.nexttext.content}',
                    randomStart : {if $object.data_map.randomstart.content}true{else}false{/if}
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
            //]]>
        </script>
        
   
    </div>
</div>           