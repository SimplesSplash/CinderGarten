<#import "parts/template.ftl" as t>

<@t.page>
<form method="POST" >
    <table class="table table-bordered "  >
     <tr>
                <th scope="col">Имя ребенка</th>
                <th scope="col">Рост, длина тела в см.</th>
                <th scope="col">Вес, масса тела в кг</th>
                <th scope="col">Окружность грудной клетки</th>
                <th scope="col">Окружность головы</th>
                <th scope="col">Группа здоровья</th>
                <th scope="col">Бег на 30 м.,сек. </th>
                <th scope="col">Метание набивного мяча 200г, см</th>
                <th scope="col">Прыжок в длину с места, см</th>
                <th scope="col">Прыжок в высоту, см</th>
            </tr>

    <#list children as child>
    <tr>
    <td>${child.fullName}</td>
    <td><input type="text" class="form-control" style="border-color: white; background-color:white"  value=" "></td>
            <td><input type="text" class="form-control" style="border-color: white; background-color:white"  value=" "></td>
            <td><input type="text" class="form-control" style="border-color: white; background-color:white"  value=" "></td>
            <td><input type="text" class="form-control" style="border-color: white; background-color:white"  value=" "></td>
            <td><input type="text" class="form-control" style="border-color: white; background-color:white"  value=" "></td>
            <td><input type="text" class="form-control" style="border-color: white; background-color:white"  value=" "></td>
            <td><input type="text" class="form-control" style="border-color: white; background-color:white"  value=" "></td>
            <td><input type="text" class="form-control" style="border-color: white; background-color:white"  value=" "></td>
            <td><input type="text" class="form-control" style="border-color: white; background-color:white"  value=" "></td>
    </tr>
    </#list>
</table>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <button type="submit" class="btn btn-primary mr-2" style="margin-bottom: 20px" />Сохранить</button>
</form>
    <button type="submit" class="btn btn-primary mr-2"  />Распечатать</button>
</@t.page>