<#import "parts/template.ftl" as t>

<@t.page>
<div>
    <button class="btn btn-primary my-2 b1" type="button" data-toggle="collapse" data-target="#table1" aria-expanded="false" aria-controls="collapseExample">
        Физическая культура 
    </button>
    <div class="collapse" id="table1">
        <table class="table table-bordered table-striped" >
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

            <td>${childName}</td>
            <td><input type="text" class="form-control" style="border-color: white; background-color:white"  value=" "></td>
            <td><input type="text" class="form-control" style="border-color: white; background-color:white"  value=" "></td>
            <td><input type="text" class="form-control" style="border-color: white; background-color:white"  value=" "></td>
            <td><input type="text" class="form-control" style="border-color: white; background-color:white"  value=" "></td>
            <td><input type="text" class="form-control" style="border-color: white; background-color:white"  value=" "></td>
            <td><input type="text" class="form-control" style="border-color: white; background-color:white"  value=" "></td>
            <td><input type="text" class="form-control" style="border-color: white; background-color:white"  value=" "></td>
            <td><input type="text" class="form-control" style="border-color: white; background-color:white"  value=" "></td>
            <td><input type="text" class="form-control" style="border-color: white; background-color:white"  value=" "></td>


        </table>
        <input type="button" class="btn btn-primary my-2" value="Печать">
    </div>
</div>
<div>
    <button class="btn btn-primary my-2 " type="button" data-toggle="collapse" data-target="#table2" aria-expanded="false" aria-controls="collapseExample">
        Воспитатель 
    </button>
    <div class="collapse" id="table2">
        <div class="table-responsive">
        <table class="table table-bordered table-striped" >
            <tr>
                <th scope="col" rowspan="3">Имя ребенка</th>
                <th scope="col"  colspan="3" rowspan="2">Приобщение к художественной литературе</th>
                <th scope="col" colspan="6">Развитие речи</th>
                <th scope="col" rowspan="3">Итоговый показатель(среднее значение)</th>
            </tr>
            <tr>
                <th scope="col">Развивающая речевая среда</th>
                <th scope="col" colspan="2">Формирование словаря</th>
                <th scope="col">Звуковая культура речи</th>
                <th scope="col">Грамматический строй речи</th>
                <th scope="col">Связная речь</th>
            </tr>
            <tr>
                <th scope="col">Умеет воспринимать содержание произведения, сопереживает героям</th>
                <th scope="col">Рассматривает иллюстративные издания книг, проявляет интерес к ним</th>
                <th scope="col">Узнает иллюстраторов</th>
                <th scope="col">Умеет понятно высказываться, отражать в речи особенности предмета, явления, состояния, поступка</th>
                <th scope="col">Использует в речи наиболее употребительные прилагательные, глаголы, наречия, предлоги</th>
                <th scope="col">Умеет определять местоположение предмета, время суток</th>
                <th scope="col">Умеет на слух различать и называть слова, начинающиеся на определенный звук</th>
                <th scope="col">Умеет употреблять в речи простейшие виды сложносочиненных и сложноподчиненных предложений</th>
                <th scope="col">Умеет описывать предмет, картину, пересказывать выразительные орывки сказок</th>
            </tr>

            <td>${childName}</td>
           <td>  <input type="text"  class="form-control" style="border-color: white; background-color:white"  value=" "></td>
           <td>  <input type="text" class="form-control" style="border-color:  white; background-color:white"  value=" "></td>
           <td>  <input type="text"  class="form-control" style="border-color: white; background-color:white"  value=" "></td>
           <td>  <input type="text"  class="form-control" style="border-color: white; background-color:white"  value=" "></td>
           <td>  <input type="text"  class="form-control" style="border-color: white; background-color:white"  value=" "></td>
           <td>  <input type="text"  class="form-control" style="border-color: white; background-color:white"  value=" "></td>
           <td>  <input type="text"  class="form-control" style="border-color: white; background-color:white"  value=" "></td>
           <td>  <input type="text"  class="form-control" style="border-color: white; background-color:white"  value=" "></td>
           <td>  <input type="text"  class="form-control" style="border-color: white; background-color:white"  value=" "></td>
           <td>  <input type="text"  class="form-control" style="border-color: white; background-color:white"  value=" "></td>

        </table>
    </div>
    </div>
</div>

<div>
    <button class="btn btn-primary my-2 " type="button" data-toggle="collapse" data-target="#table3" aria-expanded="false" aria-controls="collapseExample">
        Музыка 
    </button>
    <div class="collapse" id="table3">
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
    </div>
</div>
<div>
<button type="submit" class="btn btn-primary mr-2 my-2"  />Логопед</button>
</div>
<div>
<button type="submit" class="btn btn-primary mr-2 my-2" />Плавание</button>
</div>    
<div>    
<button type="submit" class="btn btn-primary mr-2 my-2"  />Психолог</button>
 </div>   
 
</@t.page>
