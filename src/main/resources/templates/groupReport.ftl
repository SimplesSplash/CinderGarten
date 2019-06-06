<#import "parts/template.ftl" as t>

<@t.page>
<form method="POST">
<table class="table table-bordered table-striped" >
    <tr>
        <th scope="col">Имя ребенка</th>
        <#list criterions as criteria>
            <th scope="col">${criteria.criteria}</th>
        </#list>
    </tr>
    <#list children as child>
    <td>${child.fullName}</td>
    <#list criterions as criteria>
    <td>  <input type="text" name="${child.id}_${criteria.id}" class="form-control" style="border-color: white"  value=" "></td>
        </#list>
    </#list>
</table>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <button type="submit" class="btn btn-primary mr-2"  />Сохранить</button>
</form>

</@t.page>