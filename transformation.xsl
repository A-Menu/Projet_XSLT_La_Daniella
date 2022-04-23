<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs tei"
    version="2.0">
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>   
    
        
    
    <!-- TEMPLATE PAGES HTML -->
    <xsl:template match="/">
        <!-- DEFINITION DES VARIABLES DE NOMS DE FICHIERS DE SORTIE -->
        <xsl:variable name="index_personnages">
            <xsl:text>index_personnages.html</xsl:text>
        </xsl:variable>
        <xsl:variable name="index_lieux">
            <xsl:text>index_lieux.html</xsl:text>
        </xsl:variable>
        <xsl:variable name="version_originale">
            <xsl:text>version_originale.html</xsl:text>
        </xsl:variable>
        <xsl:variable name="version_corrigee">
            <xsl:text>version_corrigee.html</xsl:text>
        </xsl:variable>
        <xsl:variable name="version_double">
            <xsl:text>version_double.html</xsl:text>
        </xsl:variable>
        <xsl:variable name="accueil">
            <xsl:text>accueil.html</xsl:text>
        </xsl:variable>
        
        <!-- DEFINITION DES VARIABLES UTILES -->
        <xsl:variable name="title">
            <xsl:value-of select="//fileDesc/titleStmt/title"/>
        </xsl:variable>
        <xsl:variable name="GS">
            <xsl:value-of select="concat(//fileDesc/titleStmt//forename, ' ', //fileDesc/titleStmt//surname)"/>
        </xsl:variable>
        <xsl:variable name="AM">
            <xsl:value-of select="concat(//respStmt//forename, ' ', //respStmt//surname)"/>
        </xsl:variable>
        
        
        <!-- PAGE D'ACCUEIL -->
        <xsl:result-document href="{$accueil}" method="html" indent="yes">
            <html>
                <head>
                    <xsl:call-template name="head"/>
                    <title>
                        <xsl:value-of select="concat($title, ' | ', 'Accueil')"/>
                    </title>                    
                </head>
                
                <body>
                    <xsl:call-template name="navbar"/>
                    <div type="container">                        
                        <h1 class="text-center">
                            <xsl:value-of select="concat('Encodage XML-TEI du chapitre VIII de ', $title, ' de ', $GS)"/>
                        </h1>
                        <div class="text-center" style="display: block; "><iframe style="width:500px; height: 572.6076409945422px; border: 0;" src="https://gallica.bnf.fr/ark:/12148/bpt6k4775546/f1.item.mini"></iframe></div>
                        <p class="text-center"><xsl:value-of select="//encodingDesc/p"/></p>
                        <div>
                            <h2>Informations relatives à la source :</h2>
                            <ul>
                                <li><b>Date originale de publication : </b><xsl:value-of select="//sourceDesc//date"/></li>
                                <li><b>Editeur : </b><i><xsl:value-of select="//biblFull/publicationStmt/publisher"/></i></li>
                                <li><b>Facsimilé : </b><a href="https://gallica.bnf.fr/ark:/12148/bpt6k4775546/f1"><xsl:value-of select="//publicationStmt/distributor"/></a></li>
                            </ul>
                        </div>   
                        <div>
                            <h2>Informations relatives à l'encodage :</h2>
                            <p><xsl:value-of select="//editionStmt/edition"/> <a href="https://github.com/A-Menu/Projet_TEI_La_Daniella/blob/master/HTML_la_daniella_a_menu.html">Voir l'ODD correspondante.</a></p>
                            <p>Transformation XSL réalisée dans le cadre du cours de XSL de Mme Ariane Pinche du Master TNAH de l'Ecole nationale des chartes.</p>
                        </div>
                        <div class="text-center">
                            Ariane Menu, 2022 <a class="github" href="https://github.com/A-Menu/Obeliste.git"><img width="28" height="28" src="images/GitHub-Mark-32px.png" alt="Voir le projet sur GitHub" title="Voir le projet sur Github"/></a>
                        </div>
                    </div>
                </body>
            </html>
        </xsl:result-document>
        
        
        <!-- PAGE VERSION ORIGINALE -->
        <xsl:result-document href="{$version_originale}" method="html" indent="yes">
            <html>
                <head>
                    <xsl:call-template name="head"/>
                    <title>
                        <xsl:value-of select="concat($title, ' | ', 'Version originale')"/>
                    </title>                    
                </head>
                
                <body>
                    <xsl:call-template name="navbar"/>
                    <div type="container">                        
                        <h1 class="text-center">
                            Version originale du texte
                        </h1>
                        <div>
                            <xsl:apply-templates select="//text" mode="original"/>
                        </div>
                    </div>
                </body>
            </html>
        </xsl:result-document>
        
        
        <!-- PAGE VERSION CORRIGEE -->
        <xsl:result-document href="{$version_corrigee}" method="html" indent="yes">
            <html>
                <head>
                    <xsl:call-template name="head"/>
                    <title>
                        <xsl:value-of select="concat($title, ' | ', 'Version corrigée')"/>
                    </title>                    
                </head>
                
                <body>
                    <xsl:call-template name="navbar"/>
                    <div type="container">                        
                        <h1 class="text-center">
                            Version corrigée du texte
                        </h1>
                        <div>
                            <xsl:apply-templates select="//text" mode="corrige"/>
                        </div>
                    </div>
                </body>
            </html>
        </xsl:result-document>
        
        
        <!-- PAGE VERSION DOUBLE -->
        <xsl:result-document href="{$version_double}" method="html" indent="yes">
            <html>
                <head>
                    <xsl:call-template name="head"/>
                    <title>
                        <xsl:value-of select="concat($title, ' | ', 'Comparaison')"/>
                    </title>                    
                </head>
                
                <body>
                    <xsl:call-template name="navbar"/>
                    <div type="container">                        
                        <h1 class="text-center">
                            Comparaison des deux versions
                        </h1>
                        <div>
                            <table>
                                <tr class="text-center">
                                    <th><h3>Version originale</h3></th>
                                    <th><h3>Version corrigée</h3></th>
                                </tr>
                                <tr>
                                    <td>
                                        <xsl:apply-templates select="//text" mode="original"/>
                                    </td>
                                    <td>
                                        <xsl:apply-templates select="//text" mode="corrige"/>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </body>
            </html>
        </xsl:result-document>
        
        
        <!-- PAGE INDEX DES PERSONNAGES -->
        <xsl:result-document href="{$index_personnages}" method="html" indent="yes">
            <html>
                <head>
                    <xsl:call-template name="head"/>
                    <title>
                        <xsl:value-of select="concat($title, ' | ', 'Personnages')"/>
                    </title>                    
                </head>
                
                <body>
                    <xsl:call-template name="navbar"/>
                    <div type="container">                        
                        <h1 class="text-center">
                            Index des personnages
                        </h1>
                        <div>
                            <ul style="text-justify; padding-left: 110px;">
                                <xsl:for-each select=".//listPerson/person[1]">
                                    <xsl:sort select="persName" order="ascending"/>
                                    <li class="p-3">
                                                <ul>
                                                    <b>
                                                        <xsl:value-of
                                                            select="/persName"/>
                                                    </b>
                                                    
                                                    <li>
                                                        <xsl:value-of
                                                            select="descendant::note"
                                                        />
                                                    </li>
                                                </ul>
                                                                                    
                                    </li>
                                </xsl:for-each>
                            </ul>                           
                        </div>
                    </div>
                </body>
            </html>
        </xsl:result-document>
        
    </xsl:template>
    
    
    <!-- NAVBAR -->
    <xsl:template name="navbar">
        <xsl:variable name="index_personnages">
            <xsl:text>index_personnages.html</xsl:text>
        </xsl:variable>
        <xsl:variable name="index_lieux">
            <xsl:text>index_lieux.html</xsl:text>
        </xsl:variable>
        <xsl:variable name="version_originale">
            <xsl:text>version_originale.html</xsl:text>
        </xsl:variable>
        <xsl:variable name="version_corrigee">
            <xsl:text>version_corrigee.html</xsl:text>
        </xsl:variable>
        <xsl:variable name="version_double">
            <xsl:text>version_double.html</xsl:text>
        </xsl:variable>
        <xsl:variable name="accueil">
            <xsl:text>accueil.html</xsl:text>
        </xsl:variable>
        
        <nav class="navbar navbar-expand-md navbar-dark justify-content-between" style="background-color: #e57a44;">
            <a class="navbar-brand" href="{$accueil}">Accueil</a>
            
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="{$version_originale}">Version originale</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{$version_corrigee}">Version corrigée</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{$version_double}">Comparer les deux versions</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{$index_personnages}">Index des personnages</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{$index_lieux}">Index des lieux</a>
                </li>
            </ul>
        </nav>
    </xsl:template>
    
    
    <!-- HEAD HTML -->
    <xsl:template name="head">        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="description" content="Édition numérique du chapitre VIII de La Daniella de George Sand"/>
        <meta name="keywords" content="XML, TEI, XSLT"/>
        <meta name="author" content="Ariane Menu"/>
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"/>
        
        <link rel="icon" type="image/png" href="images/favicon.png"/>
    
        <style type="text/css">
            /* Pour faire en sorte que les pages aient des espaces en haut et en bas et justifier le texte */
            div[type="container"] {
                margin-top: 50px;
                margin-bottom: 100px;
                margin-left: 100px;
                margin-right: 100px;
                text-align: justify;
            }
            
            /* Pour insérer un espace après les titres */
            h1 {
            margin-bottom: 30px;
            }           
            
            /* Pour insérer un espace après les titres */
            h2 {
                margin-bottom: 30px;
            }
            
            /* Pour insérer des espaces avant et après les div */
            div {
                margin-top: 50px;
                margin-bottom: 50px;
            }    
            
            /* Pour décaler à droite le logo GitHub par rapport au texte du pied de page */
            .github {
                margin-left: 8px;
            }     
            
            td {
                padding: 15px;
                text-align: justify;
            }
                       
        </style>
    
    </xsl:template>
    
    
    <xsl:template match="choice" mode="original">
        <xsl:value-of select="orig/text() | sic/text()"/>
    </xsl:template>
    
    <xsl:template match="choice" mode="corrige">
        <xsl:value-of select="reg/text() | corr/text()"/>
    </xsl:template>
    
    <xsl:template match="//body//head" mode="#all">
        <h2 class="text-center">
            <b>
                <xsl:apply-templates mode="#current"/>
            </b>
        </h2>
    </xsl:template>
    
    <xsl:template match="//body//p" mode="#all">
        <table>
            <tbody>
                <tr>
                    <td>
                        <i>
                            <xsl:number select="." level="multiple" format="1"/>
                        </i>
                    </td>
                    <td>
                        <p>
                            <xsl:apply-templates mode="#current"/>
                        </p>
                    </td>
                </tr>
            </tbody>
        </table>
    </xsl:template>
    
    <xsl:template match="//body//emph" mode="#all">
        <i>
            <xsl:apply-templates mode="#current"/>
        </i>
    </xsl:template>
    
    <xsl:template match="//body//choice" mode="comparaison">
        <b>
            <xsl:apply-templates mode="comparaison"/>
        </b>
    </xsl:template>
    
        

</xsl:stylesheet>
