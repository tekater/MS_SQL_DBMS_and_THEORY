# DMBS---MS-SQL-Theory
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
=======================================================================================================================================================================
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
