# Отчет о лаботаротоной работе

## Цель работы
В этой работе нам необходимо перейти на новое, более простое конфигурирование приложения с помощью аннотаций, добавить функционал по представлению таблиц в виде HTML и измерить скорость выполнения нашего кода c помощью инструментов АОП.

## Выполнение работы

Скопируйте результат выполнения лабораторной работы № 1 в директорию /les04/lab/

Переделайте приложение так, чтобы его конфигурирование осуществлялось с помощью аннотаций @Component

Используя аннотацию @Value и SpEL сделайте так, чтобы имя файла для загрузки продуктов, приложение получало из конфигурационного файла application.properties. Данный файл поместите в каталог ресурсов (src/main/resources)

Добавьте еще одну имплементацию интерфейса Renderer - HTMLTableRenderer которая выводит таблицу в HTML-файл. Сделайте так, чтобы при работе приложения вызывалась эта реализация, а не ConsoleTableRenderer.

С помощью событий жизненного цикла бина, выведите в консоль дату и время, когда бин ResourceFileReader был полностью инициализирован.

С помощью инструментов AOП замерьте сколько времени тратиться на парсинг CSV файла.

Приложение должно запускаться с помощью команды gradle run, выводить необходимую информацию в консоль и успешно завершаться.

Оформите отчет о выполнении лабораторной работы в виде файла README.md в директории les04/lab. Отчет должен содержать обновленную UML-диаграмму классов в формате mermaid.

``` mermaid 
classDiagram
    %% Interfaces
    class Reader {
        <<interface>>
        +read() String
    }

    class Parser {
        <<interface>>
        +parse(String text) List~Product~
    }

    class Renderer {
        <<interface>>
        +render()
    }

    class ProductProvider {
        <<interface>>
        +getProducts() List~Product~
    }

    %% Implementation Classes
    class Product {
        +productId: int
        +name: String
        +description: String
        +categoryId: int
        +price: BigDecimal
        +stockQuantity: int
        +imageUrl: String
        +createdAt: Calendar
        +updatedAt: Calendar
    }

    class ConcreteProductProvider {
        -reader: Reader
        -parser: Parser
        +getProducts() List~Product~
    }

    class HTMLTableRenderer {
        -provider: ProductProvider
        -DATE_FORMAT: SimpleDateFormat
        +render()
        -buildHtmlContent(List~Product~): String
        -buildTable(List~Product~): String
        -formatPrice(BigDecimal): String
        -escapeHtml(String): String
    }

    class CSVParser {
        +parse(String text) List~Product~
        -stringToCalendar(String): Calendar
        -stringToDecimal(String): BigDecimal
        -stringToInteger(String): Integer
    }

    class ResourceFileReader {
        -path: String
        +read(): String
        +init()
    }

    class PropertyProvider {
        -filename: String
        +getFileName(): String
    }

    class TimeAround {
        +invoke(MethodInvocation): Object
    }

    class TimeAroundPointCut {
        +matches(Method, Class~?~): boolean
    }

    class Config {
        +parser(): Parser
    }

    %% Relationships
    Reader <|.. ResourceFileReader : implements
    Parser <|.. CSVParser : implements
    Renderer <|.. HTMLTableRenderer : implements
    ProductProvider <|.. ConcreteProductProvider : implements

    ConcreteProductProvider --> Reader : depends on
    ConcreteProductProvider --> Parser : depends on
    ConcreteProductProvider --> Product : returns

    ResourceFileReader --> PropertyProvider : depends on
    HTMLTableRenderer --> ProductProvider : depends on

    CSVParser --> Product : creates

    Config ..> CSVParser : creates
    Config ..> TimeAround : uses
    Config ..> TimeAroundPointCut : uses
    ```

## Выводы
