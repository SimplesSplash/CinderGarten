




<!DOCTYPE html>
<html lang="en" style="background-color: #70c1d6">
    <head>
        <title>Личный кабинет</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <link  rel="stylesheet" href="/css/style.css"/>
    </head>
    <body style="background-color: #70c1d6">
        <div class="wrap">

            <#include "parts/navbar.ftl">
            <div class="main" style="width:40%;height: 100%;padding-bottom: 20px; margin:15px; float: left ">
                <div style="margin: 20px">
                    <h1>Главная страница</h1>
                    <div style="margin: 20px">
                        <#if teacher??>
                        <div>${teacher.firstName}</div>
                        <div>${teacher.lastName}</div>
                        <div>${teacher.patronymic}</div>
                        <div>${position.position}</div>
                        <h3>Группы:</h3>
                        <div><#list teacher.groups as group>
                            <div>${group.name}</div>
                            </#list>
                        </div>
                        <div><#if teacher.group??>
                            ${teacher.group.name}
                            </#if>
                        </div>
                        <#elseif child??>
                        <div>${child.firstName}</div>
                        <div>${child.lastName}</div>
                        <div>${child.patronymic}</div>
                        <h3>Группа:</h3>
                        <div>${child.group.name}</div>
                        <div>
                            <h4>Воспитатель:</h4>
                            <div>${tutor.fullName}</div>
                        </div>
                        <#else>
                        <div>Hello, admin</div>
                        </#if>
                    </div>

                </div>
            </div>
            <div class="main" style="width:40%; margin:15px;height: 321.528px;padding-bottom: 20px; float: right ">
                <div style="margin: 20px">
                <h1>Важная информация:</h1>
                </div>
            </div>
                 
        </div>
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>    
    </body>
    <footer>

    </footer>
</html>


