<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                version="1.0">

    <!-- Plantilla principal -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Consultas sobre Análisis de Redes Sociales y Calidad de Datos</title>
                <style>
                    body {
                        font-family: 'Arial', sans-serif;
                        background-color: #f4f4f9;
                        margin: 0;
                        padding: 0;
                    }

                    h1 {
                        background-color: #4CAF50;
                        color: white;
                        padding: 20px;
                        text-align: center;
                        margin: 0;
                    }

                    h2 {
                        background-color: #e2e2e2;
                        padding: 10px;
                        margin: 10px 0;
                        font-size: 1.2em;
                    }

                    .container {
                        margin: 20px;
                    }

                    table {
                        width: 100%;
                        margin-bottom: 20px;
                        border-collapse: collapse;
                        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                    }

                    th, td {
                        padding: 12px;
                        text-align: left;
                        border: 1px solid #ddd;
                    }

                    th {
                        background-color: #4CAF50;
                        color: white;
                    }

                    tr:nth-child(even) {
                        background-color: #f9f9f9;
                    }

                    tr:hover {
                        background-color: #f1f1f1;
                    }

                    ul {
                        list-style-type: none;
                        padding-left: 0;
                    }

                    li {
                        padding: 5px 0;
                    }

                    .query-section {
                        margin-bottom: 40px;
                    }
                </style>
            </head>
            <body>

                <h1>Consultas sobre Análisis de Redes Sociales y Calidad de Datos</h1>

                <div class="container">

                    <!-- Consultar preguntas con más de 3 respuestas -->
                    <div class="query-section">
                        <h2>Preguntas con más de 3 respuestas</h2>
                        <table>
                            <thead>
                                <tr>
                                    <th>URI</th>
                                    <th>Asunto</th>
                                </tr>
                            </thead>
                            <tbody>
                                <xsl:for-each select="//document[nbestanswers/answer_item > 3]">
                                    <tr>
                                        <td><xsl:value-of select="uri"/></td>
                                        <td><xsl:value-of select="subject"/></td>
                                    </tr>
                                </xsl:for-each>
                            </tbody>
                        </table>
                    </div>

                    <!-- Consultar preguntas con una mejor respuesta -->
                    <div class="query-section">
                        <h2>Preguntas con mejor respuesta</h2>
                        <table>
                            <thead>
                                <tr>
                                    <th>URI</th>
                                    <th>Asunto</th>
                                </tr>
                            </thead>
                            <tbody>
                                <xsl:for-each select="//document[bestanswer]">
                                    <tr>
                                        <td><xsl:value-of select="uri"/></td>
                                        <td><xsl:value-of select="subject"/></td>
                                    </tr>
                                </xsl:for-each>
                            </tbody>
                        </table>
                    </div>

                    <!-- Consultar preguntas sin contenido -->
                    <div class="query-section">
                        <h2>Preguntas sin contenido</h2>
                        <table>
                            <thead>
                                <tr>
                                    <th>URI</th>
                                    <th>Asunto</th>
                                </tr>
                            </thead>
                            <tbody>
                                <xsl:for-each select="//document[not(content)]">
                                    <tr>
                                        <td><xsl:value-of select="uri"/></td>
                                        <td><xsl:value-of select="subject"/></td>
                                    </tr>
                                </xsl:for-each>
                            </tbody>
                        </table>
                    </div>

                    <h1>Consultas sobre Calidad de Datos</h1>

                    <!-- Consultar preguntas con fecha de respuesta anterior a la fecha de la pregunta -->
                    <div class="query-section">
                        <h2>Preguntas con fecha de respuesta anterior a la pregunta</h2>
                        <table>
                            <thead>
                                <tr>
                                    <th>URI</th>
                                    <th>Asunto</th>
                                </tr>
                            </thead>
                            <tbody>
                                <xsl:for-each select="//document[res_date &lt; date]">
                                    <tr>
                                        <td><xsl:value-of select="uri"/></td>
                                        <td><xsl:value-of select="subject"/></td>
                                    </tr>
                                </xsl:for-each>
                            </tbody>
                        </table>
                    </div>

                    <!-- Consultar preguntas sin categoría definida -->
                    <div class="query-section">
                        <h2>Preguntas sin categoría definida</h2>
                        <table>
                            <thead>
                                <tr>
                                    <th>URI</th>
                                    <th>Asunto</th>
                                </tr>
                            </thead>
                            <tbody>
                                <xsl:for-each select="//document[not(cat) or not(maincat) or not(subcat)]">
                                    <tr>
                                        <td><xsl:value-of select="uri"/></td>
                                        <td><xsl:value-of select="subject"/></td>
                                    </tr>
                                </xsl:for-each>
                            </tbody>
                        </table>
                    </div>

                    <!-- Consultar preguntas sin idioma -->
                    <div class="query-section">
                        <h2>Preguntas sin idioma definido</h2>
                        <table>
                            <thead>
                                <tr>
                                    <th>URI</th>
                                    <th>Asunto</th>
                                </tr>
                            </thead>
                            <tbody>
                                <xsl:for-each select="//document[not(language)]">
                                    <tr>
                                        <td><xsl:value-of select="uri"/></td>
                                        <td><xsl:value-of select="subject"/></td>
                                    </tr>
                                </xsl:for-each>
                            </tbody>
                        </table>
                    </div>

                </div>

            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
