<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Document Database</title>
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        margin: 20px;
                        background-color: #f8f9fa;
                        color: #333;
                    }
                    h2 {
                        text-align: center;
                        color: #007bff;
                    }
                    table {
                        border-collapse: collapse;
                        width: 100%;
                        background: white;
                        box-shadow: 0px 4px 8px rgba(0,0,0,0.1);
                        border-radius: 10px;
                        overflow: hidden;
                    }
                    th, td {
                        border: 1px solid #ddd;
                        padding: 12px;
                        text-align: left;
                        white-space: pre-wrap;
                    }
                    th {
                        background-color: #007bff;
                        color: white;
                        position: sticky;
                        top: 0;
                        z-index: 2;
                    }
                    tr:nth-child(even) {
                        background-color: #f2f2f2;
                    }
                    tr:hover {
                        background-color: #ddd;
                    }
                    td:first-child {
                        font-weight: bold;
                        color: #007bff;
                    }
                </style>
            </head>
            <body>
                <h2>Document Database</h2>
                <table>
                    <tr>
                        <th>URI</th>
                        <th>Subject</th>
                        <th>Best Answer</th>
                        <th>Category</th>
                        <th>Date</th>
                    </tr>
                    <xsl:apply-templates select="//document"/>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="document">
        <tr>
            <td><xsl:value-of select="uri"/></td>
            <td><xsl:value-of select="subject"/></td>
            <td><xsl:value-of select="bestanswer"/></td>
            <td><xsl:value-of select="cat"/></td>
            <td><xsl:value-of select="date"/></td>
        </tr>
    </xsl:template>

</xsl:stylesheet>
