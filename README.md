# DBMS_MS-SQL-Theory
First lesson

~База данных - это упорядоченный набор данных.
Для работы с базой данных нужна система управления базами данных(СУБД).

	СУБД - Система Управления Базами Данных
	DMBS - Database Managment System

Существует множество разных СУБД, как сетевых так и изолированных.

~К индивидуальным относятся такие как:
  Microsoft Access(MS Access);
  Firebird;
*Такие СУБД предназначены для сравнительно небольших баз данных
и ориентированны для использования баз данных одним пользователем,
но гораздо больший интерес представляют сетевые СУБД, 
которые поддерживают достаточно большие объёмы данных.
---
~К сетевым СУБД относятся:
  MySQL;
  Oracle;
  Microsoft SQL Server;
*Кроме того что эти СУБД поддерживают большие объёмы данных,
они как правило работают на выделенном сервере,
что позволяет обращаться к Базе данных одновременно большому
количеству пользователей.

*Каждое СУБД для организации данных используют определённую модель данных,
существует множество моделей данных, Например:
  Иерархическая модель данных - шикоро используется в системе каталогов(Active Directory);
  Сетевая Модель данных;
  Объектная модель данных;
  Реляционная модель данных(Relation - Отношение) ({( Наиболее Популярна )});*1
  Primary key;

(*1)В реляционной модели данных данные представлены в виде набора связанных таблиц.
*Все вышеперечисленные СУБД являются реляционными.

*Впервые Реляционная модель данных была описана в 1970 году сотрудником IBM - Edgar F Codd,
он уложил все концепции реляционной модели в 12 правил.

~Важным моментом абсолютно любой СУБД(том числе и реляционной) является то
что абсолютно любые данные должны встречаться в базе не более одного раза,
для этого производится нормализация данных,
она выполняется в соответствии с нормальными формами,
но суть заключается в том что повторяющиеся данные выносятся в отдельные таблицы,
а затем таблицы связываются между собой, 
Это в значительной степени уменьшает объём базы данных,
а также устраняет ошибки и неоднозначности при её использовании.




-------------------------------------------------------------
|    |    |    |    |    |    |    |    |    |    |    |    |
-------------------------------------------------------------
|    |    |    |    |    |    |    |    |    |    |    |    |
-------------------------------------------------------------
|    |    |    |    |    |    |    |    |    |    |    |    |
-------------------------------------------------------------
|    |    |    |    |    |    |    |    |    |    |    |    |
-------------------------------------------------------------
|    |    |    |    |    |    |    |    |    |    |    |    |
-------------------------------------------------------------
|    |    |    |    |    |    |    |    |    |    |    |    |
-------------------------------------------------------------

~Таблица в реляционной базе данных описывается следующим Образом.
Столбцы таблицы называют полями, а строки записями.
Каждая запись в таблице обязательно должна быть уникальной
и её уникальность определяется первичным ключём(Primary key).

*Primary key(Первичный ключ) - это поле таблицы, которая никогда не может иметь
одиннаковых значений в разных записях, и даже при удалении записей,
удалённые первичные ключи не могут использоваться повторно.
Первичным ключём может быть какая-то полезная информация, 
какие-то актуальные данные, такие например как:
  табельный номер сотрудника,
  номер зачётной книжки,
  номер водительского удостоверения и т.д.
или же в качестве первичного ключа часто используют авто-счётчик.

*Первичный ключ как правило бывает простым, 
то есть уникальность записи определяет всего одно поле,
но иногда возникает необходимость сделать первичный ключ составным,
когда уникальность записи определяют сразу несколько полей,
а именно комбинация разных значений в этих полях.

*Foreign key
Важное значение имеют также Внешние ключи которые позволяют связывать таблицы.

Внешний ключ определённой таблицы повторяет значение первичного ключа в другой таблице,
и благодаря этому можно извлекать данные из другой таблицы,
Типичным примером внешний ключей являются Города.

Внешние ключи нужны для того чтобы связывать таблицы.


~Существуют разные типы связей между таблицей.
Первая простейшая связь это один к одному.

 Также существует:
  Один ко многим;
  Многие к одному;
  Многие ко многим;
Последняя не реализуема при помощи двух таблиц.
для реализации связи Многие ко Многим нужно три таблицы.
Все эти связи хоть и сама база данных часто изображается в виде ERD.

ERD - Entity-Relation Diagram (Диаграмма Сущность-Связь)
Разработка такой диаграммы как правило является одним из первых этапов проектирования базы данных,

---------------------------
|       Students          |
---------------------------       ------------------------------                                                    ---------------------------
|student_id    integer(10)|       |        specialities        |                                                    |specialities_ Teachers   |
---------------------------       ------------------------------                                                    ---------------------------
|last_name     varchar(32)|------>|speciality_id    integer(10)|--------------------------------------------------->|speciality_id integer(10)| 
---------------------------       ------------------------------                                                    ---------------------------
|first_name    varchar(32)|       |speciality_name  varchar(32)|                                                    |teacher_id    integer(10)|
---------------------------       ------------------------------                                                    ---------------------------
|birth_date    date       |                                  |                                                                        |
---------------------------                                  |                             ------------------------                   |
|speciality_id integer(10)|----------------------------------/---------------------------->|        Grades        |                   |
---------------------------                                  |            |                ------------------------                   |
|group_id      integer(10)|                                  |            V                |student_id integer(10)|                   |
---------------------------                                  |  ------------------------   ------------------------                   |
           |                                                 |  |    attendance        |   |lesson_id  integer(10)|                   |
           |                                                 |  ------------------------   ------------------------                   |
           |                                                 |  |student_id integer(10)|   |grade1     integer(10)|                   |
           |                                                 |  ------------------------   ------------------------                   |
           |                                                 |  |lesson_id integer(10) |   |grade2     integer(10)|                   |
           |                                                 |  ------------------------   ------------------------                   |
           |                                                 |             |                        |                                 |
           |                                                 |             =========================|                                 |
           |                                                 |                                      |                                 | 
           V                                                 V                                      V                                 V
------------------------                        -------------------------------    ---------------------------      ------------------------------
|       Groups         |                        |        disciplines          |--->|         Schedule        |      |         Teachers           |
------------------------                        -------------------------------    ---------------------------      ------------------------------
|group_id   integer(10)|                        |disciplines_id    integer(10)|    |lesson_id     integer(10)|      |teacher_id       integer(10)|
------------------------                         ------------------------------    ---------------------------       ------------------------------
|group_name varchar(16)|                        |name              varchar(32)|    |discipline_id integer(10)|      |last_name        varchar(32)|
------------------------                        -------------------------------    ---------------------------      ------------------------------
           |               ====================>|number_of_lessons integer(10)|    |teacher_id    integer(10)|      |first_name       varchar(32)|
           |               |                    -------------------------------    ---------------------------      ------------------------------
           |               |                    |Speciality_id     integer(10)|    |date          date       |      |birth_date       date       |
           |               |                    -------------------------------    ---------------------------      ------------------------------
           |               |                                 ^  ^                  |time          time(7)    |      |experience       integer(10)|
           |               |                                 |  |                   ---------------------------     ------------------------------
           V               |                                 |  | 
----------------------------                 ------------------------------------- 
|   complete_disciplines   |                 |       Dependent_Disciplines       |
----------------------------                 ------------------------------------- 
|group_id       integer(10)|                 |required_discipline_id  integer(10)|
----------------------------                 -------------------------------------
|discipline_id  integer(10)|                 |discipline_id           integer(10)|
----------------------------                 -------------------------------------
                                             |dependent_discipline_id integer(10)|
                                             -------------------------------------

	  
=======================================================================================================================================================================
=========             LESSON 2    =====================================================================================================================================
=======================================================================================================================================================================


Типы данных. MS SQL Server DataTypes

Как и любой язык программирования, каждая СУБД различает данные по типу,
Microsoft SQL Server делит типы данных на следующие категории:

Точные числовые типы(Exact numerics) - это все целочисленные типы и несколько вещественных.

Приблизительные числовые типы(Approximate numberics)

Строковые типы (Unicode character strings) - простые строки, юникод строки,двоичные строки.

Дата время(Date and Time) 
и прочие типы данных.

--------------------------------------------------------------------------------------
 ~Точные числовые типы:
bit, decimal,
tinyint, smallint, int, big int,
numeric, money, smallmoney

*Bit - это логический тип данных,
который хранит true или false.
false - 0
true  - 1
SQL Server оптимизирует хранение Bit в разных полях и собирает их в один байт.
В Bit могут быть преобразованы другие типы и если они имеют не нулевое значение,
то они преобразуются в true.

*tinyint - занимает один байт, принимает значение в диапозоне от 0 до 255.
int - от -2,147,483,658 до 2,147,483,658.
smallint - от -32.768

лучше использовать наименьший тип данных который 100% может сохранить нужное значение.


money      - 8 bytes, храниит значение от -922,337,203,685,477.5808 до -922,337,203,685,477.5808.
*money      - это изменённая интерпретация bigint(longlong) способная хранить 4 знака после запятой.
smallmoney - 4 bytes, хранит значение от -214,748.3648 до -214,748.3648.
*smallmoney - это изменённая интерпретация типа int способная хранить 4 знака после запятой.

*smallmoney и money - являются целочисленными типами и поэтому абсолютно точно хранят значения,
целая и дробная часть разделяется точкой, также эти типы могут использовать валютные символы.
валютные символы не заключаются в кавычки,
и при этом MS SQL Server хранит просто символ и не хранит валюту.

*decimal и numeric - это дробные типы с фиксированной точностью,
в этих типах число делается на precision(точность) и scale(масштаб),
при максимальной точности(p) от -10^38 + 1 до 10^38 - 1.

*p(precision(точность)) - это максимальное общее кол-во точности десятичных цифр,
которые нужно сохранить, включая знаки до и после запятой,
точность лежит в пределах от 1 до 38 знаков, точность по умолчанию 18 знаков.

*s(scale(масштаб)) - это кол-во десятичных цифр после запятой,
кол-во десятичных цифр до запятой определяется как разность между precision и scale,
значение scale может изменяться от 0 до precision,
и может быть задано только в том случае когда задана precision,
объём занимаемой памяти типов decimal и numeric зависит от заданной точности:
1-9   точность - 5 байт
10-19 точность - 9 байт
20-28 точность - 13 байт
29-38 точность - 17 байт 

Преобразование decimal и numeric
комбинации разных p,s SQL Server рассматривает как разные типы данных,
55,858
p = 5 - всего чисел.
s = 3 - числа после запятой.
константа с десятичной точкой автоматически преобразуется в numeric 
с минимально необходимыми p,s

преобразование из decimal и numeric во float и real может приводить к потере точности.
преобразование из целочисленных,приблизительных и денежных типов в decimal и numeric,
могут привести к арифметическому переполнению.
при преобразовании в decimal or numeric обычно происходит округление в меньшую сторону.
float могут использоваться только 17 знаков после запятой, 
большее кол-во знаков преобразуется в 0.

~Приблизительные типы.
*К приблизительным типам относятся real & float.
real - это вещественное число ординарной точности занимающее 4 байта памяти,
real ещё называют float(24), потому что его мантисса имеет длинну по умолчанию 24 бита.
float - мантису можно задавать следующим образом - float(n)
и её разрядность может быть от 1 до 53 бит,
следовательно объём занимаемой памяти float зависит от разрядности мантисы,
разрядность мантисы: 
от 1 до 24 бит, то float занимает 4 байта и может хранить 7 знаков после запятой,
от 25 до 53 бит, то float занимает 8 байтов и может хранить 15 знаков после запятой.
float ещё называют double precision.
--------------------------------------------------------------------------------------




=======================================================================================================================================================================
=========             LESSON 3    =====================================================================================================================================
=======================================================================================================================================================================



Date and Time.
для работы с датой и временем TransactSQL поддерживает 6 типов данных:
1.date
2.time
3.datetime
4.smalldatetime
5.datetime2
6.timeoffset

впервые появился в SQL Server 2008

date
по умолчанию отображает дату в формате yyyy-MM-dd
Range 0001-01-01 до 9999-12-31
месяц меняется с 1 до 12 
число с 1 до 31
всегда занимают 10 знаком позиций
Precision,scale 10,0


занимает 3 байта памяти, хранит дату как целое число с точностью до одного дня.
Значение по умолчанию 1900-09-01, это значение используется для неявного преобразования 
из типа данных time в datetime2 и datetimeoffset считают дату по грегорианскому каллендарю.
time хранит время в пределах одного дня в 24ч формате без учёта часового пояса,
время хранится с точностью до 100 наносекунд(7 знаков после , )
по умолчанию время отображается в формате hh:mm:ss[.nnnnnnn]
диапозон принимаемых значение от полуночи до полуночи - 00:00:00.000000000 до 23:59:59.9999999.
date.
может занимать от 8 до 16 знаков позиций, всегда занимает 5 байт памяти.
значение по умолчанию 00:00:00 которое используется для date datetime datetimeoffset.
для типа данных time можно задавать scale, при этом precision задаётся автоматически,
в зависимости от выбранного масштаба time может занимать от 3 до 5 байт памяти.

datetime.
Date range 1 января 1753г до 31 декабря 9999года, 
диапазон времени от полуночи до полуночи без учёта часового пояса.

Character length от 19 до 23 позиций
Storage(память) 8 байт.
хранит время с точностью до тысячной секунды,
значение по умолчанию  1900-01-01 00:00:00
дата считается по грегорианскому календарю

smalldatetime
время в 24ч формате с точностью до минут.
может хранит дату 1900-09-09 до 2079-06-06.
время хранит от полуночи до полуночи.
занимает до 19 знаков позиций,
объём занимаемой памяти 4 байта,
значение по умолчанию, 1900-01-01 00:00:00

datetime2
это расширение даных datetime которое хранит больший диапазон с большей точностью времени,
которая может быть задана пользователем,
диапозон даты 0001-01-01 до 9999-12-31
time 00:00:00 до 23:59:59.9999999
Занимает от 19 до 27 знаков позиций,
объём занимаемой памяти зависит от указаной точности, 
которая может быть до 7 знаков.( до 100 наносекунд )
если точность до 3 знаков, значение занимает 6 байт
точность от 3 до 4 знаков - 7 байт,
при большей точности datetime 2 занимает 8 байт памяти.
datetime2 может занимать разное кол-во байт на диске и в оперативной памяти.

timeoffset
определяет дату и время в 24ч формате точно также как datetime2.
а также хранит информацию о часовом поясе в формате UTC.
time 00:00:00 до 23:59:59.9999999
возможное значение во времени -14:00 до +14:00 относительно нулевого меридиана.
занимает от 26 до 24 знаков позиций.
объём занимаемой памяти при точности времени по умолчанию до 100 наносекунд (10 байт).
дата по умолчанию 1900-01-01 00:00:00 00:00
при создании переменной можно задавать scale от 0 до 7 
и при этом precision задаётся автоматически от 26 до 34.


======================================================================


~Строки
Char and varchar
char - это строка фиксированного размера.
varchar - строка переменного размера - этот тип данных может хранить все Unicode символы
char - при создании строки нужно указать её длинну, 
длинна может быть задана от 1 до 8000 символов,
для 1 байт кодировки объём занимаемой памяти всегда будет в точности совпадать с размером строки,
для много-байтовых кодировок строка сможет хранить меньше символов чем занимает байт памяти.

varchar можно задать n или max, 
использует n для определения размера строки в байтах n может быть от 1 до 8000
или можно использовать max, в этом случае varchar строка может занимать до 2 гб,
для 1байтовых кодировок объём занимаемый строкой будет на 2 байта больше чем строка содержит символов,
для многобайтовых кодировок строка будет занимать на 2 байта больше указанного размера,
она сможет хранить меньше символов чем содержит байт.


======================================================================


~Unicode character strings
nchar или varchar это строки постоянной или переменной длинны, 
которая может хранить полный набор символов в кодировке UTF 16
или же определённую часть кодировки UCS-2

nchar[n] это строка фиксированного размера,
n определяет размер строки в словах(Word = 2Bytes) от 1 до 4000 слов,
объём занимаемой памяти в два раза больше указанного размера.
в кодировке UTF-16 кол-во хранимых символов может быть меньше указанного размера(n)
из-за специальных символов, которые могут занимать по 4 байта.

nvarchar - строка переменной длинны nvarchar[(n|max)]
строка максимального размера занимает 2гб памяти,
строка nvarchar всегда занимает на 2 байта больше указанного размера.


======================================================================


~Binary strings(Двоичные строки)
binary and varbinary
binary[(n)] - строка фиксированного размера от 1 до 8000 байт.
varbinary   - строка переменного размера от 1 до 2 гб.
varbinary всегда занимает в два раза больше выделенной памяти,
размер по умолчанию 1 байт.

При преобразовании строки в binary or varbinary другого размера 
сервер выравнивает или урезает данные справа,
когда другие типы данных преобразуются в binary или varbinary 
данные выравниваются или урезаются слева,
выравнивание происходит за счёт нулей.

text or ntext - типы постоянной переменной длинны для хранения Unicode и не Unicode строк,
а также для хранения двоичных данных.

text - это строка переменной длинны 
который хранит не Unicode данные в кодировке заданной на сервере 
максимально возможная длинна данных 2гб.

ntext - это строка переменной длинны хранящая символы в формате Unicode,
может хранить до 2^30-1 символов

Image двоичные данные переменной длины максимального размера в 2гб.

В типах данных text ntext image применимы следующие функции:
datalength, settextsize, readtext, wrighttext, update text, substring.

данных могут занимать достаточно много времени и их рекомендуется запускать параллельно.

~другие типы данных, 
cursor - это тип данных для переменных 
или для выходных параметров хранимой процедуры, содержащих ссылку на курсор,

rowversion - этот тип данных предназначен для автоматически генерируемых 
уникальных двоичных чисел внутри базы данных,
обычно используется для механизма, занимает 8 байт памяти,
это обычно просто инкрементируемое число.

hierarchyid - это системный тип данных переменной длинны, для хранения позиции в иерархии,
значение этого типа генерируется приложением, 
таким образом чтобы отобразить отношение между строками.

sql_variant - этот тип данных хранит значение различных типов данных sql server'a,
этот тип данных может использоваться в полях, параметрах, переменных в качестве возвращаемых значений функций,
sql_variant позволяет объектам базы данных поддерживать значение других типов данных,
поле типа sql_variant может содержать различные типы данных,
макс длинна 8016 байт,в эту длинну включает себя.
значение этого типа прежде всего должно быть преобразовано базовый тип данных прежде использования.

sql_variant может хранить NULL, но у NULL нет базового типа,
базовым типом sql_variant не может быть sql_variant.

поля данного типа может включать в себя уникальный первичный или внешний ключ,
но общая длинна ключевого поля идентифицирующего строку не может превышать
максимально возможную длинну индекса-900 байт.

Geometry - тип данных реализован как тип данных CLR в SQL Server,
представляет данные в системе координат.

Geography - тип данных может хранить GPS координату.

table - тип данных может использоватся в функциях и хранимых процедурах



======================================================================




S Q L
Structure Query Language

DDL - Data Definition Language
(Язык определения данных)

DDL - включает в себя следующие команды:
CREATE   - Создать 
ALTER    - Изменить
DROP     - Удалить 
--------------------
DML - Data Manipulation Language
(Язык Манимулирования данных)

DML - включает в себя следующие команды:
INSERT - Вставка данных в таблице
UPDATE - Обновление данных таблице
SELECT - Выборка данных в таблице
DELETE - Удаление данных из таблиц

У каждой СУБД своя реализация языка SQL, 
поэтому кроме основных 7 запросов языка SQL 
во многих СУБД могут присутствовать свои запросы.
Такие как 
TRUNCATE,SET в Transact-SQL
