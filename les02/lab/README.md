# Отчет о лаботаротоной работе

## Цель работы

## Выполнение работы
Скачайте и установите Axiom Standard JDK 17.0.14 (предпочтительно) или Temurin JDK 17.0.14. Используйте руководство по установке.

Скачайте и установите Gradle 8.12. Используйте руководство по установке.

С помощью Gradle, в директории les02/lab создайте проект вид Java Applications, для этого воспользуйтесь руководством Building Java Applications Sample.

Добавьте в ваш проект библиотеку org.springframework:spring-context:6.2.2

Реализуйте приложение удовлетворяющее следующим требованиям:
- Приложение должно представлять собой консольное приложение разработанное с помощью фреймворка Spring и конфигурируемое с помощью Java-конфигурации.
- Приложение должно читать данные о товарах для магазина из csv-файла и выводить его в консоль в виде таблицы (см. рисунок).

CSV-файл должен располагаться в директории src/main/resources вашего приложения.

- Структура приложения должна соответствовать следующей диаграмме классов

где,
- Reader, ResourceFileReader - класс читающий данные из csv-файла;
- Parser, CSVParser - класс парсер CSV файла;
- ProductProvider, ConcreteProductProvider - класс предоставляющий список товаров;
- Renderer, ConsoleTableRenderer - класс выводящий список товаров в консоль в виде таблицы;
- Product - класс описывающий сущность "Товар"

Приложение должно запускаться с помощью команды gradle run, выводить необходимую информацию в консоль и успешно завершаться.

Оформите отчет о выполнении лабораторной работы в виде файла README.md в директории les02/lab.

 ``` mermaid 
classDiagram
    %% Интерфейсы
    class Reader {
        <<interface>>
        +read(): String
    }

    class Parser {
        <<interface>>
        +parse(String): List~Product~
    }

    class ProductProvider {
        <<interface>>
        +getProducts(): List~Product~
    }

    class Renderer {
        <<interface>>
        +render(): void
    }

    %% Сущность
    class Product {
        +long productId
        +String name
        +String description
        +int categoryId
        +BigDecimal price
        +int stockQuantity
        +String imageUrl
        +Date createdAt
        +Date updatedAt
    }

    %% Реализации
    class ResourceFileReader {
        +read(): String
    }

    class CSVParser {
        +parse(String): List~Product~
    }

    class ConcreteProductProvider {
        -Reader reader
        -Parser parser
        +getProducts(): List~Product~
    }

    class ConsoleTableRenderer {
        -ProductProvider provider
        +render(): void
    }

    %% Отношения
    Reader <|.. ResourceFileReader
    Parser <|.. CSVParser
    ProductProvider <|.. ConcreteProductProvider
    Renderer <|.. ConsoleTableRenderer

    ConcreteProductProvider --> ResourceFileReader : uses
    ConcreteProductProvider --> CSVParser : uses
    ConcreteProductProvider --> Product : returns

    ConsoleTableRenderer --> ConcreteProductProvider : depends on
    ConsoleTableRenderer --> Product : displays

    CSVParser --> Product : parses

    ```


## Выводы