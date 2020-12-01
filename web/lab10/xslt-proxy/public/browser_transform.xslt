<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <!--xsl:template говорит о том, что тут будет замена. match показывает, к какой части документа это применимо-->
  <xsl:template match="/">
    <!--Внутри шаблона пишем наше преобразование-->
    <html>
      <h1>Результат обработки браузером</h1>
      <head>
        <title>Result</title>
      </head>
      <body>
        <xsl:choose>
        <xsl:when test="hash">
          <p>
            <xsl:value-of select="hash/message"/>
          </p>
        </xsl:when>
        <xsl:otherwise>
        <table>
          <thead>
            <tr>
              <th>#</th>
              <th>first element</th>
              <th>second element</th>
            </tr>
          </thead>
          <!--Цикл-->
          <xsl:for-each select="objects/object">
            <!--Создание переменной-->
            <xsl:variable name="counter" select="position()"/>
            <tbody>
              <tr>
                <th>
                  <!--Извлекаем значение из переменной (обратите внимание на $)-->
                  <xsl:value-of select="$counter"></xsl:value-of>
                </th>
                <th>
                  <!--Извлекаем значение из XML-тега-->
                  <xsl:value-of select="elem-1"></xsl:value-of>
                </th>
                <th>
                  <xsl:value-of select="elem-2"></xsl:value-of>
                </th>
              </tr>
            </tbody>
          </xsl:for-each>
        </table>
        </xsl:otherwise>
      </xsl:choose>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>