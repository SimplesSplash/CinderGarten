<#import "parts/template.ftl" as t>

<@t.page>

<table class="table table-bordered table-striped" >
    <tr>
        <th scope="col">Имя ребенка</th>
        <#list criterions as criteria>
            <th scope="col">${criteria.criteria}</th>
        </#list>
    </tr>

    <td>${childName}</td>
    <#list results as result>
     <td>${result.result}</td>
    </#list>

</table>

</@t.page>
