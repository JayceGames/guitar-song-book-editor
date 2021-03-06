<#-- @ftlvariable name="" type="com.songbook.core.model.SongBook" -->
<#-- @ftlvariable name="lineFragment" type="com.songbook.core.model.ChordNode" -->
<#list songNodeList as songNode>
    \begin{song}{${songNode.title}}<#lt>
    <#list songNode.verseList as verseNode>

        <#-- BUILD VERSE -->
        \begin{songverse}<#lt>
        <#list verseNode.lineNodes as lineNode>
            <#-- BUILD LINE -->
            <#list lineNode.contentList as lineFragment>
                <#if lineFragment.type == "TextNode">
                    <#-- Simple text fragment (#t = ignore leading and trailing whitespace) -->
                    ${lineFragment.text}<#t>
                <#elseif lineFragment.type == "SimpleChordNode" || lineFragment.type == "MultiChordNode">
                    <#-- Simple chord e.g. "C" (#t = ignore leading and trailing whitespace) -->
                    \chord{<#t>
                    ${lineFragment.getText().replaceAll("#", "\\\\#")}<#t>
                    }<#t>
                </#if>
            </#list>
            <#-- ADD LINE BREAK -->
            <#if lineNode_has_next>
                <#-- If there are more lines and "\\" (LaTex new line) + new line -->
                \\<#lt>
            <#else>
                <#-- ... otherwise add new line only -->
                <#nt>
            </#if>
        </#list>
        \end{songverse}<#lt>
    </#list>
</#list>