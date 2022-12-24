# ApacheCommonsLang4Apex

'Apache Commons Lang3 for Apex Language'.

This is a port of StringUtils and CharUtils from Apache Commons Lang3 to Salesforce Apex Language.

Major methods have been ported. Some methods are not yet implemented.

## Usage

```java
System.assertEquals('...fghi...', StringUtils.abbreviate('abcdefghijklmno', 5, 10));
System.assertEquals('', StringUtils.defaultString(null));
System.assertEquals('bat', StringUtils.defaultString('bat'));
```

## Source

`commons-lang3-3.12.0-sources` based.

## License

- Apache License 2.0
