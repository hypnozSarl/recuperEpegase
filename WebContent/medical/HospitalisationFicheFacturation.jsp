<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="rich" uri="http://richfaces.org/rich"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
<%@taglib prefix="a4j" uri="http://richfaces.org/a4j"%>

<f:subview id="fichehospitalisation">

    <center>
        <a4j:form enctype="multipart/form-data">
            <rich:hotKey key="return" handler="return false;"/>

            <center> <h2><h:outputText value="GESTION DES HOSPITALISATIONS (Facturation)" style="color:green;"/></h2></center>

            <rich:tabPanel switchType="client" immediate="true" style="border:0px;" id="idRichTabGene">

                <rich:tab id="tabentree" label="Hospitalisation" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.autorisationEntree}">
                    <h:panelGrid id="idPanDescription" width="100%">
                        <h:panelGrid width="100%" styleClass="fichefournisseur">
                            <h:panelGrid width="100%" columns="6" columnClasses="clos12d,clos21g,clos12d,clos21g,clos12d,clos21g">
                                <h:column><h:outputText value="Date:"/></h:column>
                                <h:column>
                                    <rich:calendar value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.var_date}" inputSize="8"  enableManualInput="true" datePattern="dd/MM/yyyy"  locale="fr" style=" background-color:white;" readonly="#{bakingbeanepegase.menuModuleHorizontalCtrl.usersLog.usrDateMed==0}">
                                        <a4j:support eventsQueue="maQueue" event="onchange" reRender="prgtpAjt,outptcltAjt,link8Ajt,inptdatechce" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.controleSaisie}"/>
                                    </rich:calendar>
                                </h:column>
                                <h:column><h:outputText value="N° Hospitalisation:"/></h:column>
                                <h:column><h:inputText style="width:100%" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosNum}" readonly="true"/></h:column>
                                <h:column><h:outputText value="Dossier:"/></h:column>
                                <h:column>
                                    <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.patients.patDossier}" size="7" readonly="true"/>&nbsp;&nbsp;
                                    <h:outputText value="Série:" style="text-decoration:underline;"/>&nbsp;
                                    <h:selectOneMenu id="idSerie" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosSerie}" disabled="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.var_aff_action}">
                                        <f:selectItems value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.mesSerieUserItem}"/>
                                    </h:selectOneMenu>
                                </h:column>
                            </h:panelGrid>
                            <h:panelGrid id="grpCnt" width="100%" columns="4" columnClasses="clos12d,clos55g,clos12c,clos21g">
                                <h:column><h:outputText value="Nom Patient:" style="text-decoration:underline;width:100%"/></h:column>
                                <h:column>
                                    <h:inputText style="width:90%" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosCivilite} #{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosNomPatient}" readonly="true"/>&nbsp;&nbsp;
                                    <a4j:commandButton image="/images/detail.png" style="height:15px;width:15px" id="btndetailtiers" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.detailPatient}" onclick="javascript:Richfaces.showModalPanel('modAttente');" oncomplete="javascript:Richfaces.hideModalPanel('modAttente');" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.var_aff_detail_tiers}" reRender="modAttente,idSubView"></a4j:commandButton>
                                </h:column>
                                <h:column>
                                    <h:graphicImage url="/images/femme.png" height="26px" width="26px" alt="F" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.patients.patSexe==0}"/>
                                    <h:graphicImage url="/images/homme.png" height="26px" width="26px" alt="M" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.patients.patSexe==1}"/>
                                </h:column>
                                <h:column>
                                    <h:outputText value="Né(e) le:" />&nbsp;
                                    <h:inputText size="6" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.patients.patDateNaissance}" readonly="true"/>
                                </h:column>
                            </h:panelGrid>
                            <h:panelGrid id="grppec" width="100%" columns="6" columnClasses="clos12d,clos21g,clos12d,clos21g,clos12d,clos21g">
                                <h:column>
                                    <h:outputText value="Prise en charge:" style="text-decoration:underline;"/>&nbsp;
                                    <a4j:commandButton image="/images/actualiser.png" style="height:15px;width:15px" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.changerTarif}" onclick="javascript:Richfaces.showModalPanel('modAttente');" oncomplete="javascript:Richfaces.hideModalPanel('modAttente');" rendered="#{!bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.var_aff_action}" reRender="modAttente,idPanDescription,tableSejour,tableActes,tableMedi,tableLabo,tablePrest,idTotalListe1,idTotalListe2,idTotalListe3,idTotalListe4,idTotalListe5"></a4j:commandButton>
                                </h:column>
                                <h:column>
                                    <h:selectOneMenu id="idCat" style="width:85%" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.nomFamille}" disabled="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.var_aff_action}">
                                        <f:selectItems value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.mesCategoriesItems}"/>
                                        <a4j:support eventsQueue="maQueue" event="onchange" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.changerTarif}" onsubmit="javascript:Richfaces.showModalPanel('modAttente');" oncomplete="javascript:Richfaces.hideModalPanel('modAttente');" reRender="modAttente,gridTotal,tableLigne,ligne,grppec,idCat2,idCat3,idPec,idFond,idPanDescription,tableSejour,tableActes,tableMedi,tableLabo,tablePrest,idTotalListe1,idTotalListe2,idTotalListe3,idTotalListe4,idTotalListe5"/>
                                    </h:selectOneMenu>&nbsp;
                                    <a4j:commandButton image="/images/detail.png" title="Consultation du détail de la prise en charge sélectionnée" style="height:15px;width:15px" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.consulterTarif}" onclick="javascript:Richfaces.showModalPanel('modAttente');" oncomplete="javascript:Richfaces.hideModalPanel('modAttente');" reRender="modAttente,panelPec"></a4j:commandButton>
                                </h:column>
                                <h:column rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.optionMedical.cnamgs=='1'&&bakingbeanepegase.menuModuleHorizontalCtrl.structureLog.strcodepays=='0077'&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.nomFamille==0}"><h:outputText value="CNAMGS:" style="text-decoration:underline;"/></h:column>
                                <h:column rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.optionMedical.cnamgs=='1'&&bakingbeanepegase.menuModuleHorizontalCtrl.structureLog.strcodepays=='0077'&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.nomFamille==0}">
                                    <h:selectOneMenu id="idPec" style="width:30%" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.var_pecCnamgs}" disabled="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.var_aff_action}">
                                        <f:selectItem itemLabel="Sans" itemValue="0"/>
                                        <f:selectItems value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.lesTauxCnamgsItems}"/>
                                        <a4j:support eventsQueue="maQueue" event="onchange" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.changerTarif}" onsubmit="javascript:Richfaces.showModalPanel('modAttente');" oncomplete="javascript:Richfaces.hideModalPanel('modAttente');" reRender="modAttente,idPanDescription,grpCnt,idCat,gridTotal,tableLigne,idFond,ligne,idTotalListe1,idTotalListe2,idTotalListe3,idTotalListe4,idTotalListe5"/>
                                    </h:selectOneMenu>&nbsp;&nbsp;
                                    <h:selectOneMenu id="idFond" style="width:60%" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosFondCnamgs}" disabled="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.var_aff_action}" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.structureLog.strcodepays=='0077'&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.var_pecCnamgs!=0}">
                                        <f:selectItem itemLabel="Fonds 1 + Hospitalisation (SP)" itemValue="31"/>
                                        <f:selectItem itemLabel="Fonds 2 + Hospitalisation (AP)" itemValue="32"/>
                                        <f:selectItem itemLabel="Fonds 3 + Hospitalisation (GEF)" itemValue="33"/>
                                    </h:selectOneMenu>
                                </h:column>
                                <h:column rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.nomFamille>=1||bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.var_pecCnamgs!=0}"><h:outputText id="idCat2" value="Complémentaire:" style="text-decoration:underline;"/></h:column>
                                <h:column rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.nomFamille>=1||bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.var_pecCnamgs!=0}">
                                    <h:selectOneMenu id="idCat3" style="width:100%" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.nomComplementaire}" disabled="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.var_aff_action}">
                                        <f:selectItem itemLabel="Sans" itemValue="0"/>
                                        <f:selectItems value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.mesComplementaireItems}"/>
                                        <a4j:support eventsQueue="maQueue" event="onchange" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.changerTarif}" onsubmit="javascript:Richfaces.showModalPanel('modAttente');" oncomplete="javascript:Richfaces.hideModalPanel('modAttente');" reRender="modAttente,gridTotal,tableLigne,ligne,idTotalListe1,idTotalListe2,idTotalListe3,idTotalListe4,idTotalListe5"/>
                                    </h:selectOneMenu>
                                </h:column>
                            </h:panelGrid>
                        </h:panelGrid>
                        <h:panelGrid styleClass="fichefournisseur1" width="100%" columns="6" columnClasses="clos12d,clos21g,clos12d,clos21g,clos12d,clos21g">
                            <h:column><h:outputText value="Catégorie entrée:" style="text-decoration:underline"/></h:column>
                            <h:column>
                                <h:selectOneMenu style="width:100%;color:red" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosCategorie}">
                                    <f:selectItem itemLabel="Non spécifiée" itemValue="0"/>
                                    <f:selectItem itemLabel="Accident domestique" itemValue="1"/>
                                    <f:selectItem itemLabel="Accident de la route" itemValue="2"/>
                                    <f:selectItem itemLabel="Accident du travail" itemValue="3"/>
                                    <f:selectItem itemLabel="Maladie" itemValue="4"/>
                                    <f:selectItem itemLabel="Autre" itemValue="5"/>
                                </h:selectOneMenu>
                            </h:column>
                            <h:column><h:outputText value="Type pathologie:" style="text-decoration:underline;"/></h:column>
                            <h:column>
                                <h:selectOneMenu id="idPathologie" style="width:100%" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosPathologie}" disabled="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.var_aff_action}">
                                    <f:selectItem itemLabel="Sélection Pathologie" itemValue="100"/>
                                    <f:selectItems value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.mesPathologieItems}"/>
                                </h:selectOneMenu>
                            </h:column>
                            <h:column><h:outputText value="Protocole:" style="text-decoration:underline;"/></h:column>
                            <h:column>
                                <h:selectOneMenu id="idProtocole" style="width:100%" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosProtocole}" disabled="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.var_aff_action}">
                                    <f:selectItem itemLabel="Sélection Protocole" itemValue="100"/>
                                    <f:selectItems value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.mesProtocoleItems}"/>
                                </h:selectOneMenu>
                            </h:column>
                            <h:column><h:outputText value="Prescripteur:" style="text-decoration:underline;"/></h:column>
                            <h:column>
                                <h:selectOneMenu id="idPrescripteur" style="width:100%" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosPrescripteur}" disabled="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.var_aff_action}">
                                    <f:selectItem itemLabel="Sans Prescripteur" itemValue=""/>
                                    <f:selectItems value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.mesPrescripteurItems}" />
                                </h:selectOneMenu>
                            </h:column>
                            <h:column><h:outputText value="N° B.C.:"/></h:column>
                            <h:column><h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosNumBc}" style="width:100%" disabled="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.var_aff_action}"/></h:column>
                            <h:column><h:outputText value="N° Feuille:"/></h:column>
                            <h:column><h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosFeuille}" style="width:100%" disabled="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.var_aff_action}"/></h:column>
                            <h:column><h:outputText value="N° RUM:"/></h:column>
                            <h:column><h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosNumRum}" style="width:100%" readonly="true"/></h:column>
                        </h:panelGrid>
                        <h:panelGrid styleClass="fichefournisseur" id="gridTotal" width="100%" columns="6" columnClasses="clos12d,clos21g,clos12d,clos21g,clos12d,clos21g">
                            <h:column><h:outputText value="Total Patient:"/></h:column>
                            <h:column>
                                <h:inputText id="totht" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosTotPatient}" style="text-align:right;width:100%"  readonly="true">
                                    <jsp:include flush="true" page="/commun/formatNombreStructure.jsp"/>
                                </h:inputText>
                            </h:column>
                            <h:column><h:outputText value="Total Tiers:"/></h:column>
                            <h:column>
                                <h:inputText id="totttc" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.var_tot_tiers}" style="text-align:right;width:100%" readonly="true">
                                    <jsp:include flush="true" page="/commun/formatNombreStructure.jsp"/>
                                </h:inputText>
                            </h:column>
                            <h:column><h:outputText value="Total Général:"/></h:column>
                            <h:column>
                                <h:inputText id="totrem" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosTotGeneral}" style="text-align:right;width:100%"  readonly="true">
                                    <jsp:include flush="true" page="/commun/formatNombreStructure.jsp"/>
                                </h:inputText>
                            </h:column>
                            <h:column><h:outputText value="Reg. Patient:"/></h:column>
                            <h:column>
                                <h:inputText id="tottx" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosRegPatient}" style="text-align:right;width:100%"  readonly="true">
                                    <jsp:include flush="true" page="/commun/formatNombreStructure.jsp"/>
                                </h:inputText>
                            </h:column>
                            <h:column><h:outputText value="Reg. tiers:"/></h:column>
                            <h:column>
                                <h:inputText id="tottc" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosRegTiers}" style="text-align:right;width:100%"  readonly="true">
                                    <jsp:include flush="true" page="/commun/formatNombreStructure.jsp"/>
                                </h:inputText>
                            </h:column>
                            <h:column><h:outputText value="Solde:"/></h:column>
                            <h:column>
                                <h:inputText id="totreg" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.var_solde}" style="text-align:right;width:100%"  readonly="true">
                                    <jsp:include flush="true" page="/commun/formatNombreStructure.jsp"/>
                                </h:inputText>
                            </h:column>
                        </h:panelGrid>
                    </h:panelGrid>
                </rich:tab>

                <rich:tab id="tabsejour" label="Séjour(s)" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.visibleOnglet&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.var_acc_sejour}" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.autorisationSejour}">
                    <jsp:include flush="true" page="/medical/HospitalisationCommun.jsp" />
                    <h:panelGrid width="100%">
                        <h:panelGrid id="btnSejour" columns="6" width="200px" style="height:34px" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.rw}">
                            <a4j:commandButton image="/images/ajouter.png" title="Ajouter un séjour" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosEtat<=1&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.menumedical.add}" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.ajouterSejour}" reRender="panelSejour,btnSejour"/>
                            <a4j:commandButton image="/images/modifier.png" title="Modifier le sejour sélectionné" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.afficheButtLit&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.menumedical.maj}" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.modifierSejour}" reRender="panelSejour,btnSejour"/>
                            <a4j:commandButton title="Changer le service du séjour sélectionnée" style="height:22px;width:22px" image="/images/permutter.jpeg" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.usersChrono.usrchrUpdate==0&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.visibiliteBton&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosEtat==1&&(bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationSejour.hossejRegPatient==0||bakingbeanepegase.menuModuleHorizontalCtrl.usersLog.usrMedicalAvoir==1)&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.menumedical.maj}" onclick="if (!confirm('Etes-vous sur de vouloir changer le service ?')) return false;javascript:Richfaces.showModalPanel('modAttente');" oncomplete="javascript:Richfaces.hideModalPanel('modAttente');" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.changerService}" reRender="panelChangerService"/>
                            <a4j:commandButton image="/images/supprimer.png" title="Supprimer le séjour sélectionné" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.afficheButtLit&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationSejour.hossejRegPatient==0&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.menumedical.sup}" onclick="if (!confirm('Etes-vous sur de vouloir supprimer cet élément?')) return false" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.supprimerSejour}" reRender="tableSejour,btnSejour"/>
                            <a4j:commandButton image="/images/annuler_big.png" title="Annuler le séjour sélectionné" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.afficheButtLit&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationSejour.hossejRegPatient!=0&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.usersChrono.usrchrUpdate==0&&bakingbeanepegase.menuModuleHorizontalCtrl.usersLog.usrMedicalAvoir==1&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.menumedical.sup}" onclick="if (!confirm('Etes-vous sur de vouloir annuler cet élément?')) return false" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.avoirSejour}" reRender="tableSejour,btnSejour"/>
                            <a4j:commandButton image="/images/transferer.png" title="Quitter le séjour sélectionné" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.afficheButtLit&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.usersChrono.usrchrUpdate==0&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.menumedical.maj}" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.quitterSejour}" reRender="panelSejour,btnSejour"/>
                        </h:panelGrid>
                        <a4j:region renderRegionOnly="false">
                            <rich:extendedDataTable border="0" headerClass="headerTab" id="tableSejour" activeClass="active-row" noDataLabel=" " rowClasses="rows1,rows2,rowsd" height="300px" width="100%" style="border:solid 1px green" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.dataModelSejours}" var="sejour">
                                <a4j:support eventsQueue="maQueue" event="onRowClick" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.selectionSejour}" onsubmit="javascript:Richfaces.showModalPanel('modAttente');" oncomplete="javascript:Richfaces.hideModalPanel('modAttente');" reRender="modAttente,btnSejour,idTableau"/>
                                <rich:column label="Code" sortable="false" width="10%">
                                    <f:facet name="header"><h:outputText  value="Entrée"/></f:facet>
                                    <h:outputText  value="#{sejour.hossejDateEntree}">
                                        <f:convertDateTime pattern="dd/MM/yy" locale="fr" />
                                    </h:outputText>
                                </rich:column>
                                <rich:column label="Provenance" sortable="false" width="10%">
                                    <f:facet name="header"><h:outputText  value="Provenance"/></f:facet>
                                    <h:outputText value="#{sejour.libelleProvenance}"/>
                                </rich:column>
                                <rich:column label="Nom de l'examen" sortable="false" width="10%">
                                    <f:facet name="header"><h:outputText  value="Sortie"/></f:facet>
                                    <h:outputText value="#{sejour.hossejDateSortie}">
                                        <f:convertDateTime pattern="dd/MM/yy" locale="fr" />
                                    </h:outputText>
                                </rich:column>
                                <rich:column label="Nombre de jours" sortable="false" width="5%" style="text-align:right;">
                                    <f:facet name="header"><h:outputText  value="Nb Jours"/></f:facet>
                                    <h:outputText value="#{sejour.hossejNbJour}" style="text-align:right;">
                                        <f:convertNumber groupingUsed="true" locale="FR" minFractionDigits="2" maxFractionDigits="2"/>
                                    </h:outputText>
                                </rich:column>
                                <rich:column label="Destination" sortable="false" width="10%">
                                    <f:facet name="header"><h:outputText  value="Destination"/></f:facet>
                                    <h:outputText value="#{sejour.libelleDestination}"/>
                                </rich:column>
                                <rich:column label="Service" sortable="false" width="20%">
                                    <f:facet name="header"><h:outputText  value="Service"/></f:facet>
                                    <h:outputText value="#{sejour.hossejService}"/>
                                </rich:column>
                                <rich:column label="Cétégorie de lit" sortable="false" width="15%">
                                    <f:facet name="header"><h:outputText  value="Lit"/></f:facet>
                                    <h:outputText value="#{sejour.hossejLit}:#{sejour.hossejLibelle}"/>
                                </rich:column>
                                <rich:column label="Part Patient" sortable="false" width="10%" style="text-align:right;">
                                    <f:facet name="header"><h:outputText  value="P.Patient"/></f:facet>
                                    <h:outputText value="#{sejour.totalPatient}" style="text-align:right;">
                                        <jsp:include flush="true" page="/commun/formatNombreStructure.jsp"/>
                                    </h:outputText>
                                </rich:column>
                                <rich:column label="Part Tiers" sortable="false" width="10%" style="text-align:right;">
                                    <f:facet name="header"><h:outputText  value="P.Tiers"/></f:facet>
                                    <h:outputText value="#{sejour.totalTiers}" style="text-align:right;">
                                        <jsp:include flush="true" page="/commun/formatNombreStructure.jsp"/>
                                    </h:outputText>
                                </rich:column>
                            </rich:extendedDataTable>
                            <h:panelGrid width="100%" id="idTotalListe1" columns="4" columnClasses="clos15,clos35,clos15,clos35">
                                <h:column><h:outputText value="Total Facture:"/></h:column>
                                <h:column>
                                    <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.totalDocFacture}" style="text-align:right" readonly="true" disabled="true">
                                        <jsp:include flush="true" page="../commun/formatNombreStructure.jsp"/>
                                    </h:inputText>
                                </h:column>
                                <h:column><h:outputText value="Total Tiers:"/></h:column>
                                <h:column>
                                    <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.totalDocTiers}" style="text-align:right" readonly="true" disabled="true">
                                        <jsp:include flush="true" page="../commun/formatNombreStructure.jsp"/>
                                    </h:inputText>
                                </h:column>
                                <h:column><h:outputText value="Total Patient:"/></h:column>
                                <h:column>
                                    <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.totalDocPatient}" style="text-align:right" readonly="true" disabled="true">
                                        <jsp:include flush="true" page="../commun/formatNombreStructure.jsp"/>
                                    </h:inputText>
                                </h:column>
                                <h:column><h:outputText value="Total Réglement:"/></h:column>
                                <h:column>
                                    <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.totalDocReglement}" style="text-align:right" readonly="true" disabled="true">
                                        <jsp:include flush="true" page="../commun/formatNombreStructure.jsp"/>
                                    </h:inputText>
                                </h:column>
                            </h:panelGrid>
                        </a4j:region>

                    </h:panelGrid>
                </rich:tab>

                <rich:tab id="idcaution" label="Cautions" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.visibleOnglet&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.var_acc_reglement}" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.autorisationReglement}">
                    <jsp:include flush="true" page="/medical/HospitalisationCommun.jsp" />
                    <h:panelGrid width="100%">
                        <h:panelGrid id="btnCaution" columns="4" width="200px" style="height:34px" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.rw}">
                            <a4j:commandButton image="/images/ajouter.png" title="Ajouter unr caution" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.afficheButtSejour&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosEtat<=1&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.menumedical.add}" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.ajouterCaution}" reRender="panelCaution"/>
                            <a4j:commandButton image="/images/modifier.png" title="Modifier une caution" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.afficheButtCaution&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationCaution.hoscauEtat==0&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.menumedical.maj}" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.modifierCaution}" reRender="panelCaution"/>
                            <a4j:commandButton image="/images/supprimer.png" title="Supprimer une caution" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.afficheButtCaution&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationCaution.hoscauEtat==0&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.menumedical.sup}" onclick="if (!confirm('Etes-vous sur de vouloir supprimer cet élément?')) return false;javascript:Richfaces.showModalPanel('modAttente');" oncomplete="javascript:Richfaces.hideModalPanel('modAttente');" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.supprimerCaution}" reRender="modAttente,tableCaution,btnCaution"/>
                            <a4j:commandButton image="/images/annuler_big.png" title="Annuler une caution" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.afficheButtCaution&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationCaution.hoscauEtat!=0&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.usersChrono.usrchrUpdate==0&&bakingbeanepegase.menuModuleHorizontalCtrl.usersLog.usrMedicalAvoir==1&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.menumedical.sup}" onclick="if (!confirm('Etes-vous sur de vouloir annuler cet élément?')) return false" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.avoirCaution}" reRender="tableCaution,btnCaution"/>
                        </h:panelGrid>
                        <a4j:region renderRegionOnly="false">
                            <rich:extendedDataTable border="0" headerClass="headerTab" id="tableCaution" activeClass="active-row" noDataLabel=" " rowClasses="rows1,rows2,rowsd" height="300px" width="100%" style="border:solid 0px green;" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.dataModelCaution}" var="caut" >
                                <a4j:support eventsQueue="maQueue" event="onRowClick" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.selectionCaution}" reRender="btnCaution"/>
                                <rich:column sortable="false" width="12%">
                                    <f:facet name="header"><h:outputText  value="Date"/></f:facet>
                                    <h:outputText value="#{caut.hoscauDate}">
                                        <f:convertDateTime pattern="dd/MM/yyyy" locale="fr" />
                                    </h:outputText>
                                </rich:column>
                                <rich:column sortable="false" style="text-align:right;" width="12%">
                                    <f:facet name="header"><h:outputText value="Montant caution"/></f:facet>
                                    <h:outputText value="#{caut.hoscauMontant}" rendered="#{caut.hoscauMontant!=0}">
                                        <jsp:include flush="true" page="/commun/formatNombreStructure.jsp"/>
                                    </h:outputText>
                                </rich:column>
                                <rich:column sortable="false" style="text-align:right;" width="15%">
                                    <f:facet name="header"><h:outputText value="Numéro reçu"/></f:facet>
                                    <h:outputText value="#{caut.hoscauNumRecu}"/>
                                </rich:column>
                                <rich:column sortable="false" style="text-align:right;" width="15%">
                                    <f:facet name="header"><h:outputText value="Service"/></f:facet>
                                    <h:outputText value="#{caut.hoscauService}"/>
                                </rich:column>
                            </rich:extendedDataTable>
                        </a4j:region>
                    </h:panelGrid>
                </rich:tab>

                <rich:tab id="idactes" label="Actes et Examens" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.visibleOnglet&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.var_acc_acte}" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.autorisationActes}">
                    <jsp:include flush="true" page="/medical/HospitalisationCommun.jsp" />
                    <h:panelGrid width="100%">
                        <h:panelGrid id="btnActe" columns="5" width="200px" style="height:34px" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.rw}">
                            <a4j:commandButton image="/images/ajouter.png" title="Ajouter acte" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.afficheButtSejour&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosEtat<=1&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.menumedical.add}" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.ajouterActes}" reRender="panelActes"/>
                            <a4j:commandButton image="/images/modifier.png" title="Modifier acte" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.afficheButtActes&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationActes.hosactRegPatient==0&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.menumedical.maj}" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.modifierActes}" reRender="panelActes"/>
                            <a4j:commandButton image="/images/supprimer.png" title="Supprimer acte" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.afficheButtActes&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationActes.hosactRegPatient==0&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.menumedical.sup}" onclick="if (!confirm('Etes-vous sur de vouloir supprimer cet élément?')) return false" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.supprimerActe}" reRender="tableActes,btnActe"/>
                            <a4j:commandButton image="/images/annuler_big.png" title="Rembourser acte" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.afficheButtActes&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationActes.hosactRegPatient!=0&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.usersChrono.usrchrUpdate==0&&bakingbeanepegase.menuModuleHorizontalCtrl.usersLog.usrMedicalAvoir==1&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.menumedical.sup}" onclick="if (!confirm('Etes-vous sur de vouloir rembourser cet élément?')) return false" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.avoirActe}" reRender="tableActes,btnActe"/>
                            <a4j:commandButton image="/images/supprimer.png" title="Annuler acte" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.afficheButtActes&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationActes.hosactRegPatient!=0&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.usersChrono.usrchrUpdate==0&&bakingbeanepegase.menuModuleHorizontalCtrl.usersLog.usrMedicalAvoir==1&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.menumedical.sup}" onclick="if (!confirm('Etes-vous sur de vouloir annuler cet élément?')) return false" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.annulationActe}" reRender="tableActes,btnActe"/>
                        </h:panelGrid>
                        <a4j:region renderRegionOnly="false">
                            <rich:extendedDataTable border="0" headerClass="headerTab" id="tableActes" activeClass="active-row" noDataLabel=" " rowClasses="rows1,rows2,rowsd" height="300px" width="100%" style="border:solid 0px green;" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.dataModelActes}" var="acte" >
                                <a4j:support eventsQueue="maQueue" event="onRowClick" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.selectionActes}" reRender="btnActe"/>
                                <rich:column sortable="false" width="10%">
                                    <f:facet name="header"><h:outputText  value="Service"/></f:facet>
                                    <h:outputText value="#{acte.hosactService}"/>
                                </rich:column>
                                <rich:column sortable="false" width="10%">
                                    <f:facet name="header"><h:outputText  value="Médecin"/></f:facet>
                                    <h:outputText value="#{acte.hosactMedecin}"/>
                                </rich:column>
                                <rich:column sortable="false" width="8%">
                                    <f:facet name="header"><h:outputText  value="Code"/></f:facet>
                                    <h:outputText  value="#{acte.hosactProduit}"/>
                                </rich:column>
                                <rich:column sortable="false" width="32%">
                                    <f:facet name="header"><h:outputText  value="Libellé"/></f:facet>
                                    <h:inputTextarea rows="1" value="#{acte.hosactLibelle}" readonly="true" style="width:95%"/>
                                </rich:column>
                                <rich:column label="Code lettre" sortable="false" style="text-align:right" width="15%" >
                                    <f:facet name="header"><h:outputText  value="Lettre"/></f:facet>
                                    <h:outputText value="#{acte.hosactLettre}: #{acte.hosactNb} * #{acte.hosactValeur} (#{acte.hosactCoef})" rendered="#{acte.hosactNb!=0}"/>
                                </rich:column>
                                <rich:column sortable="false" style="text-align:right;" width="10%">
                                    <f:facet name="header"><h:outputText value="Patient"/></f:facet>
                                    <h:outputText value="#{acte.totalPatient}" rendered="#{acte.totalPatient!=0}">
                                        <jsp:include flush="true" page="/commun/formatNombreStructure.jsp"/>
                                    </h:outputText>
                                </rich:column>
                                <rich:column sortable="false" style="text-align:right;" width="10%">
                                    <f:facet name="header"><h:outputText value="Tiers"/></f:facet>
                                    <h:outputText value="#{acte.totalTiers}" rendered="#{acte.totalTiers!=0}">
                                        <jsp:include flush="true" page="/commun/formatNombreStructure.jsp"/>
                                    </h:outputText>
                                </rich:column>
                                <rich:column sortable="false" style="text-align:right;" width="5%">
                                    <f:facet name="header"><h:outputText value="Nb"/></f:facet>
                                    <h:outputText value="#{acte.hosactQte}" rendered="#{acte.hosactQte!=0}">
                                        <f:convertNumber groupingUsed="true" locale="FR" minFractionDigits="2" maxFractionDigits="2"/>
                                    </h:outputText>
                                </rich:column>
                            </rich:extendedDataTable>
                            <h:panelGrid width="100%" id="idTotalListe2" columns="4" columnClasses="clos15,clos35,clos15,clos35">
                                <h:column><h:outputText value="Total Facture:"/></h:column>
                                <h:column>
                                    <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.totalDocFacture}" style="text-align:right" readonly="true" disabled="true">
                                        <jsp:include flush="true" page="../commun/formatNombreStructure.jsp"/>
                                    </h:inputText>
                                </h:column>
                                <h:column><h:outputText value="Total Tiers:"/></h:column>
                                <h:column>
                                    <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.totalDocTiers}" style="text-align:right" readonly="true" disabled="true">
                                        <jsp:include flush="true" page="../commun/formatNombreStructure.jsp"/>
                                    </h:inputText>
                                </h:column>
                                <h:column><h:outputText value="Total Patient:"/></h:column>
                                <h:column>
                                    <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.totalDocPatient}" style="text-align:right" readonly="true" disabled="true">
                                        <jsp:include flush="true" page="../commun/formatNombreStructure.jsp"/>
                                    </h:inputText>
                                </h:column>
                                <h:column><h:outputText value="Total Réglement:"/></h:column>
                                <h:column>
                                    <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.totalDocReglement}" style="text-align:right" readonly="true" disabled="true">
                                        <jsp:include flush="true" page="../commun/formatNombreStructure.jsp"/>
                                    </h:inputText>
                                </h:column>
                            </h:panelGrid>
                        </a4j:region>
                    </h:panelGrid>
                </rich:tab>

                <rich:tab id="idMedicamment" label="Médicamments" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.visibleOnglet&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.var_acc_medicament}" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.autorisationMedicament}">
                    <jsp:include flush="true" page="/medical/HospitalisationCommun.jsp" />
                    <h:panelGrid width="100%">
                        <h:panelGrid id="btnOrdo" columns="5" width="200px" style="height:34px" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.rw}">
                            <a4j:commandButton image="/images/ajouter.png" title="Ajouter médicamment" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.afficheButtSejour&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosEtat<=1&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.menumedical.add}" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.ajouterMedicamment}"  reRender="panelMedi"/>
                            <a4j:commandButton image="/images/modifier.png" title="Modifier médicamment" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.afficheButtOrdo&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationMedi.hosmedRegPatient==0&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.menumedical.maj}" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.modifierMedicamment}"  reRender="panelMedi"/>
                            <a4j:commandButton image="/images/supprimer.png" title="Supprimer médicamment" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.afficheButtOrdo&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationMedi.hosmedRegPatient==0&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.menumedical.sup}" onclick="if (!confirm('Etes-vous sur de vouloir supprimer cet élément?')) return false" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.supprimerMedicamment}" reRender="btnOrdo,tableMedi"/>
                            <a4j:commandButton image="/images/annuler_big.png" title="Remburser médicamment" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.afficheButtOrdo&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationMedi.hosmedRegPatient!=0&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.usersChrono.usrchrUpdate==0&&bakingbeanepegase.menuModuleHorizontalCtrl.usersLog.usrMedicalAvoir==1&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.menumedical.sup}" onclick="if (!confirm('Etes-vous sur de vouloir rembourser cet élément?')) return false" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.avoirMedicamment}" reRender="btnOrdo,tableMedi"/>
                            <a4j:commandButton image="/images/supprimer.png" title="Annuler médicamment" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.afficheButtOrdo&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationMedi.hosmedRegPatient!=0&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.usersChrono.usrchrUpdate==0&&bakingbeanepegase.menuModuleHorizontalCtrl.usersLog.usrMedicalAvoir==1&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.menumedical.sup}" onclick="if (!confirm('Etes-vous sur de vouloir annuler cet élément?')) return false" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.annulationMedicamment}" reRender="btnOrdo,tableMedi"/>
                        </h:panelGrid>
                        <a4j:region renderRegionOnly="false">
                            <rich:extendedDataTable border="0" headerClass="headerTab" id="tableMedi" activeClass="active-row" noDataLabel=" " rowClasses="rows1,rows2,rowsd" height="300px" width="100%" style="border:solid 0px green;" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.dataModelMedi}" var="ordo" >
                                <a4j:support eventsQueue="maQueue"  event="onRowClick" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.selectionMedicamment}" reRender="btnOrdo,ligneOrdo"/>
                                <rich:column sortable="false" width="10%">
                                    <f:facet name="header"><h:outputText  value="Service"/></f:facet>
                                    <h:outputText value="#{ordo.hosmedService}"/>
                                </rich:column>
                                <rich:column sortable="false" width="10%">
                                    <f:facet name="header"><h:outputText  value="Médecin"/></f:facet>
                                    <h:outputText value="#{ordo.hosmedMedecin}"/>
                                </rich:column>
                                <rich:column sortable="false" width="8%">
                                    <f:facet name="header"><h:outputText  value="Code"/></f:facet>
                                    <h:outputText  value="#{ordo.hosmedProduit}"/>
                                </rich:column>
                                <rich:column sortable="false" width="22%">
                                    <f:facet name="header"><h:outputText  value="Libellé"/></f:facet>
                                    <h:outputText value="#{ordo.hosmedLibelle}"/>
                                </rich:column>
                                <rich:column label="Dépot" sortable="false" width="12%" >
                                    <f:facet name="header"><h:outputText  value="Dépot"/></f:facet>
                                    <h:outputText value="#{ordo.hosmedDepot}"/>
                                </rich:column>
                                <rich:column sortable="false" style="text-align:right" width="5%" >
                                    <f:facet name="header"><h:outputText  value="Qté"/></f:facet>
                                    <h:outputText value="#{ordo.hosmedQte}" />
                                </rich:column>
                                <rich:column sortable="false" style="text-align:right;" width="10%">
                                    <f:facet name="header"><h:outputText value="Patient"/></f:facet>
                                    <h:outputText value="#{ordo.totalPatient}" rendered="#{ordo.totalPatient!=0}">
                                        <jsp:include flush="true" page="/commun/formatNombreStructure.jsp"/>
                                    </h:outputText>
                                </rich:column>
                                <rich:column sortable="false" style="text-align:right;" width="10%">
                                    <f:facet name="header"><h:outputText value="Tiers"/></f:facet>
                                    <h:outputText value="#{ordo.totalTiers}" rendered="#{ordo.totalTiers!=0}">
                                        <jsp:include flush="true" page="/commun/formatNombreStructure.jsp"/>
                                    </h:outputText>
                                </rich:column>
                            </rich:extendedDataTable>
                            <h:panelGrid width="100%" id="idTotalListe3" columns="4" columnClasses="clos15,clos35,clos15,clos35">
                                <h:column><h:outputText value="Total Facture:"/></h:column>
                                <h:column>
                                    <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.totalDocFacture}" style="text-align:right" readonly="true" disabled="true">
                                        <jsp:include flush="true" page="../commun/formatNombreStructure.jsp"/>
                                    </h:inputText>
                                </h:column>
                                <h:column><h:outputText value="Total Tiers:"/></h:column>
                                <h:column>
                                    <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.totalDocTiers}" style="text-align:right" readonly="true" disabled="true">
                                        <jsp:include flush="true" page="../commun/formatNombreStructure.jsp"/>
                                    </h:inputText>
                                </h:column>
                                <h:column><h:outputText value="Total Patient:"/></h:column>
                                <h:column>
                                    <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.totalDocPatient}" style="text-align:right" readonly="true" disabled="true">
                                        <jsp:include flush="true" page="../commun/formatNombreStructure.jsp"/>
                                    </h:inputText>
                                </h:column>
                                <h:column><h:outputText value="Total Réglement:"/></h:column>
                                <h:column>
                                    <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.totalDocReglement}" style="text-align:right" readonly="true" disabled="true">
                                        <jsp:include flush="true" page="../commun/formatNombreStructure.jsp"/>
                                    </h:inputText>
                                </h:column>
                            </h:panelGrid>
                        </a4j:region>
                    </h:panelGrid>
                </rich:tab>

                <rich:tab id="idLaboratoire" label="Laboratoire" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.visibleOnglet&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.var_acc_examComplementaire}" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.autorisationExamComplementaire}">
                    <jsp:include flush="true" page="/medical/HospitalisationCommun.jsp" />
                    <h:panelGrid width="100%">
                        <h:panelGrid id="btnLabo" columns="5" width="200px" style="height:34px" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.rw}">
                            <a4j:commandButton image="/images/ajouter.png" title="Ajouter examen laboratoire" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.afficheButtSejour&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosEtat<=1&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.menumedical.add}" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.ajouterLaboratoire}" reRender="panelLabo"/>
                            <a4j:commandButton image="/images/modifier.png" title="Modifier examen laboratoire" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.afficheButtLabo&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationLabo.hoslabRegPatient==0&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.menumedical.maj}" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.modifierLaboratoire}" reRender="panelLabo"/>
                            <a4j:commandButton image="/images/supprimer.png" title="Supprimer examen laboratoire" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.afficheButtLabo&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationLabo.hoslabRegPatient==0&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.menumedical.sup}" onclick="if (!confirm('Etes-vous sur de vouloir supprimer cet élément?')) return false" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.supprimerLaboratoire}" reRender="tableLabo,btnLabo"/>
                            <a4j:commandButton image="/images/annuler_big.png" title="Rembourser examen laboratoire" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.afficheButtLabo&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationLabo.hoslabRegPatient!=0&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.usersChrono.usrchrUpdate==0&&bakingbeanepegase.menuModuleHorizontalCtrl.usersLog.usrMedicalAvoir==1&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.menumedical.sup}" onclick="if (!confirm('Etes-vous sur de vouloir rembourser cet élément?')) return false" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.avoirLaboratoire}" reRender="tableLabo,btnLabo"/>
                            <a4j:commandButton image="/images/supprimer.png" title="Annuler examen laboratoire" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.afficheButtLabo&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationLabo.hoslabRegPatient!=0&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.usersChrono.usrchrUpdate==0&&bakingbeanepegase.menuModuleHorizontalCtrl.usersLog.usrMedicalAvoir==1&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.menumedical.sup}" onclick="if (!confirm('Etes-vous sur de vouloir annuler cet élément?')) return false" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.annulationLaboratoire}" reRender="tableLabo,btnLabo"/>
                        </h:panelGrid>
                        <a4j:region renderRegionOnly="false">
                            <rich:extendedDataTable border="0" headerClass="headerTab" id="tableLabo" activeClass="active-row" noDataLabel=" " rowClasses="rows1,rows2,rowsd" height="300px" width="100%" style="border:solid 0px green;" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.dataModelLabo}" var="labo" >
                                <a4j:support eventsQueue="maQueue" event="onRowClick" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.selectionLaboratoire}" reRender="btnLabo,ligneLabo"/>
                                <rich:column sortable="false" width="10%">
                                    <f:facet name="header"><h:outputText  value="Service"/></f:facet>
                                    <h:outputText value="#{labo.hoslabService}"/>
                                </rich:column>
                                <rich:column sortable="false" width="10%">
                                    <f:facet name="header"><h:outputText  value="Laboratoire"/></f:facet>
                                    <h:outputText value="#{labo.hoslabLaboratoire}"/>
                                </rich:column>
                                <rich:column sortable="false" width="8%">
                                    <f:facet name="header"><h:outputText  value="Code"/></f:facet>
                                    <h:outputText  value="#{labo.hoslabProduit}"/>
                                </rich:column>
                                <rich:column sortable="false" width="32%">
                                    <f:facet name="header"><h:outputText  value="Libellé"/></f:facet>
                                    <h:inputTextarea rows="1" value="#{labo.hoslabLibelle}" readonly="true" style="width:95%"/>
                                </rich:column>
                                <rich:column label="Code lettre" sortable="false" style="text-align:right" width="15%" >
                                    <f:facet name="header"><h:outputText  value="Lettre"/></f:facet>
                                    <h:outputText value="#{labo.hoslabLettre}: #{labo.hoslabNb} * #{labo.hoslabValeur} (#{labo.hoslabCoef})" rendered="#{labo.hoslabNb!=0}"/>
                                </rich:column>
                                <rich:column sortable="false" style="text-align:right;" width="10%">
                                    <f:facet name="header"><h:outputText value="Patient"/></f:facet>
                                    <h:outputText value="#{labo.totalPatient}" rendered="#{labo.totalPatient!=0}">
                                        <jsp:include flush="true" page="/commun/formatNombreStructure.jsp"/>
                                    </h:outputText>
                                </rich:column>
                                <rich:column sortable="false" style="text-align:right;" width="10%">
                                    <f:facet name="header"><h:outputText value="Tiers"/></f:facet>
                                    <h:outputText value="#{labo.totalTiers}" rendered="#{labo.totalTiers!=0}">
                                        <jsp:include flush="true" page="/commun/formatNombreStructure.jsp"/>
                                    </h:outputText>
                                </rich:column>
                            </rich:extendedDataTable>
                            <h:panelGrid width="100%" id="idTotalListe4" columns="4" columnClasses="clos15,clos35,clos15,clos35">
                                <h:column><h:outputText value="Total Facture:"/></h:column>
                                <h:column>
                                    <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.totalDocFacture}" style="text-align:right" readonly="true" disabled="true">
                                        <jsp:include flush="true" page="../commun/formatNombreStructure.jsp"/>
                                    </h:inputText>
                                </h:column>
                                <h:column><h:outputText value="Total Tiers:"/></h:column>
                                <h:column>
                                    <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.totalDocTiers}" style="text-align:right" readonly="true" disabled="true">
                                        <jsp:include flush="true" page="../commun/formatNombreStructure.jsp"/>
                                    </h:inputText>
                                </h:column>
                                <h:column><h:outputText value="Total Patient:"/></h:column>
                                <h:column>
                                    <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.totalDocPatient}" style="text-align:right" readonly="true" disabled="true">
                                        <jsp:include flush="true" page="../commun/formatNombreStructure.jsp"/>
                                    </h:inputText>
                                </h:column>
                                <h:column><h:outputText value="Total Réglement:"/></h:column>
                                <h:column>
                                    <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.totalDocReglement}" style="text-align:right" readonly="true" disabled="true">
                                        <jsp:include flush="true" page="../commun/formatNombreStructure.jsp"/>
                                    </h:inputText>
                                </h:column>
                            </h:panelGrid>
                        </a4j:region>
                    </h:panelGrid>
                </rich:tab>

                <rich:tab id="idAutresPrestations" label="Autres prestations" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.visibleOnglet&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.var_acc_prestation}" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.autorisationPrestation}">
                    <jsp:include flush="true" page="/medical/HospitalisationCommun.jsp" />
                    <h:panelGrid width="100%">
                        <h:panelGrid id="btnPrest" columns="5" width="200px" style="height:34px" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.rw}">
                            <a4j:commandButton image="/images/ajouter.png" title="Ajouter prestation" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.afficheButtSejour&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosEtat<=1&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.menumedical.add}" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.ajouterPrestation}" reRender="panelPrest"/>
                            <a4j:commandButton image="/images/modifier.png" title="Modifier prestation" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.rw&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.afficheButtPrest&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationPrest.hosprtRegPatient==0&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.menumedical.maj}" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.modifierPrestation}" reRender="panelPrest"/>
                            <a4j:commandButton image="/images/supprimer.png" title="Supprimer prestation" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.rw&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.afficheButtPrest&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationPrest.hosprtRegPatient==0&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.menumedical.sup}" onclick="if (!confirm('Etes-vous sur de vouloir supprimer cet élément?')) return false" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.supprimerPrestation}" reRender="tablePrest,btnPrest"/>
                            <a4j:commandButton image="/images/annuler_big.png" title="Rembourser prestation" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.rw&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.afficheButtPrest&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationPrest.hosprtRegPatient!=0&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.usersChrono.usrchrUpdate==0&&bakingbeanepegase.menuModuleHorizontalCtrl.usersLog.usrMedicalAvoir==1&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.menumedical.sup}" onclick="if (!confirm('Etes-vous sur de vouloir rembourser cet élément?')) return false" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.avoirPrestation}" reRender="tablePrest,btnPrest"/>
                            <a4j:commandButton image="/images/supprimer.png" title="Annuler prestation" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.rw&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.afficheButtPrest&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationPrest.hosprtRegPatient!=0&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.usersChrono.usrchrUpdate==0&&bakingbeanepegase.menuModuleHorizontalCtrl.usersLog.usrMedicalAvoir==1&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.menumedical.sup}" onclick="if (!confirm('Etes-vous sur de vouloir annuler cet élément?')) return false" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.annulationPrestation}" reRender="tablePrest,btnPrest"/>
                        </h:panelGrid>
                        <a4j:region renderRegionOnly="false">
                            <rich:extendedDataTable border="0" headerClass="headerTab" id="tablePrest" activeClass="active-row" noDataLabel=" " rowClasses="rows1,rows2,rowsd" height="300px" width="100%" style="border:solid 0px green;" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.dataModelPrest}" var="prest" >
                                <a4j:support eventsQueue="maQueue" event="onRowClick" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.selectionPrestationListe}" reRender="btnPrest,lignePrest"/>
                                <rich:column sortable="false" width="10%">
                                    <f:facet name="header"><h:outputText  value="Service"/></f:facet>
                                    <h:outputText value="#{prest.hoslabService}"/>
                                </rich:column>
                                <rich:column sortable="false" width="10%">
                                    <f:facet name="header"><h:outputText  value="Médecin"/></f:facet>
                                    <h:outputText value="#{prest.hoslabMedecin}"/>
                                </rich:column>
                                <rich:column sortable="false" width="8%">
                                    <f:facet name="header"><h:outputText  value="Code"/></f:facet>
                                    <h:outputText  value="#{prest.hosprtProduit}"/>
                                </rich:column>
                                <rich:column sortable="false" width="32%">
                                    <f:facet name="header"><h:outputText  value="Libellé"/></f:facet>
                                    <h:inputTextarea rows="1" value="#{prest.hosprtLibelle}" readonly="true" style="width:95%"/>
                                </rich:column>
                                <rich:column label="Code lettre" sortable="false" style="text-align:right" width="15%" >
                                    <f:facet name="header"><h:outputText  value="Lettre"/></f:facet>
                                    <h:outputText value="#{prest.hosprtLettre}: #{prest.hosprtNb} * #{prest.hosprtValeur} (#{prest.hosprtCoef})" rendered="#{prest.hosprtNb!=0}"/>
                                </rich:column>
                                <rich:column sortable="false" style="text-align:right;" width="10%">
                                    <f:facet name="header"><h:outputText value="Patient"/></f:facet>
                                    <h:outputText value="#{prest.totalPatient}" rendered="#{prest.totalPatient!=0}">
                                        <jsp:include flush="true" page="/commun/formatNombreStructure.jsp"/>
                                    </h:outputText>
                                </rich:column>
                                <rich:column sortable="false" style="text-align:right;" width="10%">
                                    <f:facet name="header"><h:outputText value="Tiers"/></f:facet>
                                    <h:outputText value="#{prest.totalTiers}" rendered="#{prest.totalTiers!=0}">
                                        <jsp:include flush="true" page="/commun/formatNombreStructure.jsp"/>
                                    </h:outputText>
                                </rich:column>
                            </rich:extendedDataTable>
                            <h:panelGrid width="100%" id="idTotalListe5" columns="4" columnClasses="clos15,clos35,clos15,clos35">
                                <h:column><h:outputText value="Total Facture:"/></h:column>
                                <h:column>
                                    <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.totalDocFacture}" style="text-align:right" readonly="true" disabled="true">
                                        <jsp:include flush="true" page="../commun/formatNombreStructure.jsp"/>
                                    </h:inputText>
                                </h:column>
                                <h:column><h:outputText value="Total Tiers:"/></h:column>
                                <h:column>
                                    <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.totalDocTiers}" style="text-align:right" readonly="true" disabled="true">
                                        <jsp:include flush="true" page="../commun/formatNombreStructure.jsp"/>
                                    </h:inputText>
                                </h:column>
                                <h:column><h:outputText value="Total Patient:"/></h:column>
                                <h:column>
                                    <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.totalDocPatient}" style="text-align:right" readonly="true" disabled="true">
                                        <jsp:include flush="true" page="../commun/formatNombreStructure.jsp"/>
                                    </h:inputText>
                                </h:column>
                                <h:column><h:outputText value="Total Réglement:"/></h:column>
                                <h:column>
                                    <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.totalDocReglement}" style="text-align:right" readonly="true" disabled="true">
                                        <jsp:include flush="true" page="../commun/formatNombreStructure.jsp"/>
                                    </h:inputText>
                                </h:column>
                            </h:panelGrid>
                        </a4j:region>
                    </h:panelGrid>
                </rich:tab>

                <rich:tab label="Scan" id="idScan" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.visibleOnglet}">
                    <jsp:include flush="true" page="/medical/HospitalisationCommun.jsp" />
                    <h:panelGrid width="100%" id="idPanScan">
                        <h:panelGrid width="100%" headerClass="headerTab">
                            <f:facet name="header"><h:outputText value="LISTE DES DOCUMENTS SCANNES"/></f:facet>
                            <br>
                            <a4j:region renderRegionOnly="false">
                                <h:panelGroup id="idScanGlobal" rendered="#{!bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.var_aff_action}">
                                    <a4j:commandButton title="Ajouter document" image="/images/ajouter.png" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.ajouterDocumentScan}" reRender="panalAjoutFile"/>
                                </h:panelGroup>
                                <rich:dataGrid  style="background:transparent;border:0px;border:solid 1px green" width="100%" columns="5" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.dataModelDocumnts}" id="listeDoc" var="document" >
                                    <f:facet name="header"></f:facet>
                                    <rich:column>
                                        <a4j:commandButton  image="/images/imp_reader_big.png" value="#{document}" style="width:80px:height:80px" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.lectureDoc}" reRender="panalVisuPj"/>
                                        <br>
                                        <h:outputText value="#{document}"/>
                                    </rich:column>
                                </rich:dataGrid>
                            </a4j:region>
                        </h:panelGrid>
                    </h:panelGrid>
                </rich:tab>

                <rich:tab label="Règlement" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.visibleOnglet&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.var_acc_reglement}" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.autorisationReglement}">
                    <jsp:include flush="true" page="/medical/HospitalisationCommun.jsp" />
                    <a4j:region renderRegionOnly="false">
                        <rich:extendedDataTable id="lignerecu" height="200px" width="100%" border="0" headerClass="headerTab" activeClass="active-row" noDataLabel=" " style="margin-top:10px;border:solid 0px green;cursor:pointer;" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.datamodelRecu}"  var="recu"  sortMode="multi">
                            <jsp:include flush="true" page="/commun/listeReglementDocument.jsp"/>
                        </rich:extendedDataTable>
                    </a4j:region>
                </rich:tab>

                <rich:tab label="Etat" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.visibleOnglet&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.var_acc_etat}" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.autorisationEtat}">
                    <a4j:support eventsQueue="maQueue" event="onlabelclick" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.calculeEtat}" reRender="idPanEtat"/>
                    <jsp:include flush="true" page="/medical/HospitalisationCommun.jsp" />
                    <h:panelGrid width="100%" id="idPanEtat">
                        <h:panelGrid columns="2" columnClasses="clos20,clos80" width="100%">
                            <h:column><h:outputText value="ID HOSPITALISATION"/></h:column>
                            <h:column><h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosId}" size="20" readonly="true"/></h:column>
                            <h:column><h:outputText value="Créateur:"/></h:column>
                            <h:column><h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosNomCreateur}" size="100" readonly="true"/></h:column>
                            <h:column><h:outputText value="ID créateur:"/></h:column>
                            <h:column><h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosIdCreateur}" size="20" readonly="true"/></h:column>
                            <h:column><h:outputText value="Date de création:"/></h:column>
                            <h:column>
                                <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosDateCreat}" readonly="true">
                                    <f:convertDateTime pattern="dd/MM/yyyy:HH.mm.ss" locale="fr" />
                                </h:inputText>
                            </h:column>
                            <h:column><h:outputText value="Modificateur:"/></h:column>
                            <h:column><h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosNomModif}" size="100" readonly="true"/></h:column>
                            <h:column><h:outputText value="ID modificateur:"/></h:column>
                            <h:column><h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosIdModif}" size="20" readonly="true"/></h:column>
                            <h:column><h:outputText value="Date de modification:"/></h:column>
                            <h:column>
                                <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosDateModif}" readonly="true">
                                    <f:convertDateTime pattern="dd/MM/yyyy:HH.mm.ss" locale="fr" />
                                </h:inputText>
                            </h:column>
                            <h:column><h:outputText value="Date d'impression:"/></h:column>
                            <h:column>
                                <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosDateImp}" readonly="true">
                                    <f:convertDateTime pattern="dd/MM/yyyy:HH.mm.ss" locale="fr" />
                                </h:inputText>
                            </h:column>
                            <h:column><h:outputText value="Date transfert en comptabilité:"/></h:column>
                            <h:column>
                                <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosDateTransfert}" readonly="true">
                                    <f:convertDateTime pattern="dd/MM/yyyy" locale="fr" />
                                </h:inputText>
                            </h:column>
                            <h:column><h:outputText value="Etat:"/></h:column>
                            <h:column>
                                <h:selectOneMenu style="width:180px" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosEtat}" disabled="true">
                                    <f:selectItem itemLabel="En cours" itemValue="0"/>
                                    <f:selectItem itemLabel="Validé" itemValue="1"/>
                                    <f:selectItem itemLabel="Gelé" itemValue="2"/>
                                    <f:selectItem itemLabel="Annulé" itemValue="3"/>
                                    <f:selectItem itemLabel="Cloturé" itemValue="4"/>
                                    <f:selectItem itemLabel="Controlée" itemValue="5"/>
                                    <f:selectItem itemLabel="Refacturée Ass./Soc." itemValue="6"/>
                                    <f:selectItem itemLabel="Refacturée Compl." itemValue="7"/>
                                </h:selectOneMenu>&nbsp;&nbsp;&nbsp;
                                <a4j:commandButton value="Réactiver le document" style="color:red"  rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.rw&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosEtat==3&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.menumedical.maj}" onclick="if (!confirm('Etes-vous sur de vouloir réactiver ce document ?')) return false" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.reactiverDocument}" reRender="idPanEtat"/>
                            </h:column>
                        </h:panelGrid>
                        <h:panelGrid columns="2" style="background-color:#DAEECB;" columnClasses="clos20,clos80" width="100%">
                            <h:column><h:outputText value="Etat validation:"/></h:column>
                            <h:column>
                                <h:selectOneMenu style="width:180px" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosEtatVal}" disabled="true">
                                    <f:selectItem itemLabel="Sans méthode de validation" itemValue="0"/>
                                    <f:selectItem itemLabel="Avec méthode de validation" itemValue="1"/>
                                </h:selectOneMenu>
                            </h:column>
                            <h:column><h:outputText value="Date d'annulation:"/></h:column>
                            <h:column>
                                <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosDateAnnule}" readonly="true">
                                    <f:convertDateTime pattern="dd/MM/yyyy:HH.mm.ss" locale="fr" />
                                </h:inputText>
                            </h:column>
                            <h:column><h:outputText value="Motif d'annulation:"/></h:column>
                            <h:column><h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosMotifAnnule}" size="100" readonly="true"/></h:column>
                            <h:column><h:outputText value="Date refacturation:"/></h:column>
                            <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.dateRefacturation}" readonly="true">
                                <f:convertDateTime pattern="dd/MM/yyyy:HH.mm.ss" locale="fr" />
                            </h:inputText>
                            <h:column><h:outputText value="Numéro refacturation:"/></h:column>
                            <h:column><h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.numRefacturation}" size="20" readonly="true"/></h:column>
                            <h:column><h:outputText value="Etat refacturation:"/></h:column>
                            <h:column><h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.etatRefacuration}" size="20" readonly="true"/></h:column>
                            <h:column><h:outputText value="Bloque la refacturation:"/></h:column>
                            <h:column>
                                <a4j:commandButton value="Refacturation autorisée" style="color:blue" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.bloqueFacturation}" reRender="idPanEtat" disabled="#{!bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.autoriseRefacturation}" rendered="#{!bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosBloqueRefacturation}"/>
                                <a4j:commandButton value="Refacturation bloquée" style="color:red" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.deBloqueFacturation}" reRender="idPanEtat" disabled="#{!bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.autoriseRefacturation}" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosBloqueRefacturation}"/>
                            </h:column>
                        </h:panelGrid>
                    </h:panelGrid>
                </rich:tab>

                <rich:tab label="Traçabilité" id="tabTrace" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.visibleOnglet}">
                    <jsp:include flush="true" page="/medical/ConsultationGeneCommun.jsp" />
                    <a4j:support eventsQueue="maQueue" event="onlabelclick" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.chargerDocumentTrace}" onsubmit="javascript:Richfaces.showModalPanel('modAttente');" oncomplete="javascript:Richfaces.hideModalPanel('modAttente');" reRender="modAttente,panTrace"/>
                    <h:panelGrid id="panTrace" width="100%">
                        <a4j:region renderRegionOnly="false">
                            <rich:extendedDataTable height="300px" border="0" headerClass="headerTab" activeClass="active-row" noDataLabel=" " style="margin-top:10px;border:solid 0px green;width:100%;height:150px;cursor:pointer;" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.datamodelDocumentTrace}"  var="var"  sortMode="multi">
                                <a4j:support eventsQueue="maQueue" event="onRowClick" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.selectionTracabilite}"/>
                                <rich:column label="N° Facture" sortable="true" sortBy="#{var.factureEnteteMedical.facNum}" >
                                    <f:facet name="header"><h:outputText  value="N°" /></f:facet>
                                    <h:outputText value="#{var.factureEnteteMedical.facNum}"/>
                                </rich:column>
                                <rich:column label="Date" sortable="true" sortBy="#{var.factureEnteteMedical.facDate}" width="70px" sortOrder="ASCENDING">
                                    <f:facet name="header"><h:outputText  value="Date" /></f:facet>
                                    <h:outputText value="#{var.factureEnteteMedical.facDate}">
                                        <f:convertDateTime pattern="dd/MM/yy" locale="fr" />
                                    </h:outputText>
                                </rich:column>
                                <rich:column label="Date début période" sortable="true" sortBy="#{var.factureEnteteMedical.facDateDebut}" width="70px">
                                    <f:facet name="header"><h:outputText  value="Début" /></f:facet>
                                    <h:outputText value="#{var.factureEnteteMedical.facDateDebut}">
                                        <f:convertDateTime pattern="dd/MM/yy" locale="fr" />
                                    </h:outputText>
                                </rich:column>
                                <rich:column label="Date fin période" sortable="true" sortBy="#{var.factureEnteteMedical.facDateFin}" width="70px">
                                    <f:facet name="header"><h:outputText  value="Fin" /></f:facet>
                                    <h:outputText value="#{var.factureEnteteMedical.facDateFin}">
                                        <f:convertDateTime pattern="dd/MM/yy" locale="fr" />
                                    </h:outputText>
                                </rich:column>
                                <rich:column label="Série" sortable="true" sortBy="#{var.factureEnteteMedical.facSerie}" style="text-align:center;" width="40px">
                                    <f:facet name="header"><h:outputText  value="S." /></f:facet>
                                    <h:outputText value="#{var.factureEnteteMedical.facSerie}"/>
                                </rich:column>
                                <rich:column label="Famille tarification" sortable="true" sortBy="#{var.factureEnteteMedical.facCat}" width="70px" style="text-align:center;">
                                    <f:facet name="header"><h:outputText  value="Tar." /></f:facet>
                                    <h:outputText value="#{var.factureEnteteMedical.facCat}"/>
                                </rich:column>
                                <rich:column label="Etat" sortable="true" sortBy="#{var.factureEnteteMedical.facEtat}" width="50px" style="text-align:center;">
                                    <f:facet name="header"><h:outputText  value="Etat" /></f:facet>
                                    <h:outputText value="#{var.factureEnteteMedical.libelleEta}"/>
                                </rich:column>
                                <rich:column label="Tiers" sortable="true" sortBy="#{var.factureEnteteMedical.facNomTiers}" width="200px">
                                    <f:facet name="header"><h:outputText  value="tiers"  /></f:facet>
                                    <h:outputText  value="#{var.factureEnteteMedical.facNomTiers}" />
                                </rich:column>
                                <rich:column label="Adhérent" sortable="true" sortBy="#{var.factureEnteteMedical.facNomAdherent}" width="200px">
                                    <f:facet name="header"><h:outputText  value="Adhérent/localisation"  /></f:facet>
                                    <h:outputText  value="#{var.factureEnteteMedical.facNomAdherent}" rendered="#{var.factureEnteteMedical.facIdAdherent!=0}"/>
                                    <h:outputText  value="#{var.factureEnteteMedical.facSecteurAgent}" rendered="#{var.factureEnteteMedical.facSecteurAgent!=null}"/>
                                </rich:column>
                                <rich:column label="Total T.T.C." sortable="true" sortBy="#{var.factureEnteteMedical.facTotTtc}" style="text-align:right;">
                                    <f:facet name="header"><h:outputText  value="T.T.C."/></f:facet>
                                    <h:outputText  value="#{var.factureEnteteMedical.facTotTtc}" rendered="#{var.factureEnteteMedical.facTotTtc!=0}">
                                        <jsp:include flush="true" page="/commun/formatNombreStructure.jsp"/>
                                    </h:outputText>
                                </rich:column>
                            </rich:extendedDataTable>
                        </a4j:region>
                    </h:panelGrid>
                </rich:tab>

            </rich:tabPanel>

            <h:panelGroup id="prgtpAjt">
                <center>
                    <h:commandButton image="/images/annuler_big.png" id="linkanuAjt" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.annuleSaisie}"  />&nbsp;&nbsp;
                    <h:commandButton image="/images/valider_big.png" id="link8Ajt" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.save}" rendered="#{!bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.var_aff_action}" />
                </center>              
            </h:panelGroup>

        </a4j:form>
    </center>


    <rich:modalPanel id="panelDiagnostic" headerClass="headerPanel" width="1000" height="650" style="border:solid 1px black;background-color:white;border-radius:10px;box-shadow: 10px 10px 2px 1px rgba(0,0,0,0.5);" showWhenRendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.showModalPaneldiagnostic}">
        <c:if test="${bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.showModalPaneldiagnostic}" var="dia">
            <f:facet name="header"><h:outputText value="RECHERCHE DE DIAGNOSTIC"></h:outputText></f:facet>
            <a4j:form id="formModalpanelDiagnostic">
                <rich:hotKey key="return" handler="return false;"/>
                <h:panelGrid  width="100%">
                    <h:panelGrid  width="100%" columns="5">
                        <h:column><h:outputText value="Code CMD:"/></h:column>
                        <h:column><h:inputText style="width:100%;" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.recherche_cmd}" /></h:column>
                        <h:column><h:outputText value="Diagnostic:"/></h:column>
                        <h:column><h:inputText style="width:100%;" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.recherche_diag}" /></h:column>
                        <h:column>
                            <a4j:commandButton  value="RECHERCHER" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.rechercheSuite}" onclick="javascript:Richfaces.showModalPanel('modAttente');" oncomplete="javascript:Richfaces.hideModalPanel('modAttente');" reRender="idTableDiag,scrollTable1"/>
                        </h:column>
                    </h:panelGrid>
                    <br>
                    <a4j:region renderRegionOnly="false">
                        <rich:datascroller renderIfSinglePage="false" pageIndexVar="pageIndex" pagesVar="pages" id="scrollTable1" maxPages="20"align="left" for="idTableDiag"/>
                        <rich:extendedDataTable rows="200" id="idTableDiag" border="0" headerClass="headerTab" activeClass="active-row" noDataLabel=" " rowClasses="rows1,rows2,rowsd" height="450px" width="100%" style="border:solid 1px green" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.dataModelDiagnostic}" var="diag" >
                            <a4j:support eventsQueue="maQueue"  event="onRowClick" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.selectionDiagnostic}" reRender="diag,lib1,idValCim"/>
                            <rich:column  width="10%" sortable="true" sortBy="#{diag.cimCodeCmd}" >
                                <f:facet name="header"><h:outputText  value="Code CMD"/></f:facet>
                                <h:outputText value="#{diag.cimCodeCmd}"/>
                            </rich:column>
                            <rich:column  width="30%" sortable="true" sortBy="#{diag.cimLibCmd}" >
                                <f:facet name="header"><h:outputText  value="Libellé CMD"/></f:facet>
                                <h:inputTextarea value="#{diag.cimLibCmd}" rows="2" readonly="true" style="width:100%"/>
                            </rich:column>
                            <rich:column  width="10%" sortable="true" sortBy="#{diag.cimCode}" >
                                <f:facet name="header"><h:outputText  value="Code CIM"/></f:facet>
                                <h:outputText value="#{diag.cimCode}"/>
                            </rich:column>
                            <rich:column width="30%" sortable="true" sortBy="#{diag.cimLibelleFR}">
                                <f:facet name="header"><h:outputText  value="Libellé CIM"/></f:facet>
                                <h:inputTextarea  value="#{diag.cimLibelleFR}" rows="2" readonly="true" style="width:100%"/>
                            </rich:column>
                            <rich:column width="20%" sortable="true" sortBy="#{diag.cimLibelleUK}">
                                <f:facet name="header"><h:outputText  value="Raccourci personnel"/></f:facet>
                                <h:inputText value="#{diag.cimLibelleUK}" style="width:100%">
                                    <a4j:support eventsQueue="maQueue" event="onchange" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.majRaccourciPersonnel}" />
                                </h:inputText>
                            </rich:column>
                        </rich:extendedDataTable>
                    </a4j:region>
                </h:panelGrid>
                <br>
                <h:panelGroup id="idValCim">
                    <center>
                        <a4j:commandButton image="/images/annuler_big.png" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.annuleDiagostic}" reRender="panelDiagnostic,idDiagnostics"/>&nbsp;&nbsp;&nbsp;
                        <a4j:commandButton image="/images/valider_big.png" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.calculeDiagnostic}" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.cimMedical.cimId!=0}" reRender="panelDiagnostic,idDiagnostics"/>
                    </center>
                </h:panelGroup>
            </a4j:form>
        </c:if>
    </rich:modalPanel>


    <rich:modalPanel domElementAttachment="parent"  id="panelSejour" headerClass="headerPanel" style="border:solid 1px black;background-color:white;border-radius:10px;box-shadow: 10px 10px 2px 1px rgba(0,0,0,0.5);" width="800" height="510" showWhenRendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.showModalPanelSejour}">
        <c:if test="${bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.showModalPanelSejour}" var="sej">
            <f:facet name="header"><h:outputText value="Définition du séjour"/></f:facet>
            <a4j:form id="formModalSejour">
                <rich:hotKey key="return" handler="return false;"/>

                <rich:tabPanel switchType="client" immediate="true" style="border:0px;">

                    <rich:tab id="tabDecriptionSejourEntree" label="Séjour Entrée" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationSejour.hossejDateSortie!=null||!bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.quitterSejour}">
                        <h:panelGrid width="100%" id="idSejourGlobal">
                            <h:panelGrid width="100%" columns="2" columnClasses="clos25,clos75" styleClass="fichefournisseur" id="idSejourPrix">
                                <h:column><h:outputText value="Service:"/></h:column>
                                <h:column>
                                    <h:selectOneMenu style="width:100%" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationSejour.hossejService}" disabled="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosEtat>=2}">
                                        <f:selectItems value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.mesServicesItems}"/>
                                        <a4j:support eventsQueue="maQueue" event="onchange" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.calculMedecinSejour}" reRender="idMedecinSejour"/>
                                    </h:selectOneMenu>
                                </h:column>
                                <h:column><h:outputText value="Médecin:"/></h:column>
                                <h:column>
                                    <h:selectOneMenu id="idMedecinSejour" style="width:100%" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationSejour.hossejIdMedecin}" disabled="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosEtat>=2}">
                                        <f:selectItem itemLabel="Sélection Médecin" itemValue="0"/>
                                        <f:selectItems value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.mesMedecinsItem}"/>
                                        <a4j:support eventsQueue="maQueue" event="onchange" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.verifValideSejour}" reRender="valprd1"/>
                                    </h:selectOneMenu>
                                </h:column>
                                <h:column><h:outputText value="Catégorie Lit:"/></h:column>
                                <h:column>
                                    <h:selectOneMenu style="width:100%" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationSejour.hossejLit}" disabled="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosEtat>=2}">
                                        <f:selectItems value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.lesLitsItems}"/>
                                        <a4j:support eventsQueue="maQueue" event="onchange" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.calculPrixNouveauSejour}" reRender="idPuLit,valprd1,idSejourGlobal,idSejourPrix,idTotalLit,idTotalSejour,idTotalSejourForfait"/>
                                    </h:selectOneMenu>
                                </h:column>

                                <h:column rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.usersLog.usrVerRemise==0}"><h:outputText value="Rem."/></h:column>
                                <h:column rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.usersLog.usrVerRemise==0}">
                                    <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationSejour.hossejRemise}" style="width:50px;text-align:right;" onkeypress="return scanToucheChiffre(event)">
                                        <f:convertNumber groupingUsed="true" locale="FR" minFractionDigits="2" maxFractionDigits="2"/>
                                    </h:inputText>
                                </h:column>
                                <h:column rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.usersLog.usrVerRabais==0}"><h:outputText value="Rab."/></h:column>
                                <h:column rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.usersLog.usrVerRabais==0}">
                                    <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationSejour.hossejRabais}" style="width:50px;text-align:right;" onkeypress="return scanToucheChiffre(event)">
                                        <jsp:include flush="true" page="/commun/formatNombreStructure.jsp"/>
                                    </h:inputText>
                                </h:column>

                                <h:column><h:outputText value="Prix unitaire:"/></h:column>
                                <h:column>
                                    <h:inputText id="idPuLit" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationSejour.hossejPu}" disabled="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.verrouPrvente&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationSejour.hossejPu!=0&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosEtat>=2}" style="text-align:right;" onkeypress="return scanToucheChiffre(event)">
                                        <jsp:include flush="true" page="/commun/formatNombreStructure.jsp"/>
                                    </h:inputText>
                                </h:column>
                                <h:column><h:outputText value="Nombre de jours théoriques:"/></h:column>
                                <h:column>
                                    <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationSejour.hossejNbJourTheo}" disabled="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.verrouPrvente&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationSejour.hossejPu!=0&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosEtat>=2}"  readonly="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationSejour.hossejDateSortie!=null}" style="text-align:right;" onkeypress="return scanToucheChiffre(event)">
                                        <f:convertNumber groupingUsed="true" locale="FR" minFractionDigits="0" maxFractionDigits="0"/>
                                        <a4j:support eventsQueue="maQueue" event="onblur" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.calculPrixSejour}" reRender="idSejourGlobal,idSejourPrix,idTotalLit,idTotalSejour,idTotalSejourForfait"/>
                                    </h:inputText>
                                </h:column>
                            </h:panelGrid>
                            <h:panelGrid width="100%" columns="2" columnClasses="clos25,clos75" styleClass="fichefournisseur1" id="idMotif">
                                <h:column><h:outputText value="Date entrée:"/></h:column>
                                <h:column>
                                    <rich:calendar value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationSejour.hossejDateEntree}"  inputSize="8"  enableManualInput="false" datePattern="dd/MM/yyyy"  locale="fr" style=" background-color:white;" disabled="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosEtat>=2}">
                                        <a4j:support eventsQueue="maQueue" event="onchanged" reRender="idNbJour,idPP,idPT" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.calculenbJourSejour}"/>
                                    </rich:calendar>
                                </h:column>
                                <h:column><h:outputText value="Mode entrée:" style="text-decoration:underline;"/></h:column>
                                <h:column>
                                    <h:selectOneMenu style="width:100%" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationSejour.hossejMotifEntree}" disabled="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosEtat>=2}">
                                        <f:selectItem itemLabel="Sélection Mode Entrée" itemValue=""/>
                                        <f:selectItems value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.lesMotifsEntreeItems}"/>
                                        <a4j:support eventsQueue="maQueue" event="onchange" reRender="idMotif,idMotif2,idProv1,idProv2"/>
                                    </h:selectOneMenu>
                                </h:column>
                                <h:column><h:outputText id="idProv1" value="Provenance:" style="text-decoration:underline;" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationSejour.hossejMotifEntree!='8'}"/></h:column>
                                <h:column>
                                    <h:selectOneMenu id="idProv2" style="width:100%" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationSejour.hossejProvenance}" disabled="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosEtat>=2}" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationSejour.hossejMotifEntree!='8'}">
                                        <f:selectItem itemLabel="Sélection Provenance" itemValue=""/>
                                        <f:selectItems value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.lesProvenancesItems}"/>
                                    </h:selectOneMenu>
                                </h:column>
                            </h:panelGrid>
                            <h:panelGrid width="100%" columns="2" columnClasses="clos25,clos75" styleClass="fichefournisseur" id="idTotalSejour">
                                <h:column><h:outputText value="Part Patient:"/></h:column>
                                <h:column>
                                    <h:inputText id="idPP" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationSejour.totalPatient}" readonly="true" style="text-align:right;">
                                        <jsp:include flush="true" page="/commun/formatNombreStructure.jsp"/>
                                    </h:inputText>
                                </h:column>
                                <h:column><h:outputText value="Part Tiers:"/></h:column>
                                <h:column>
                                    <h:inputText id="idPT" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationSejour.totalTiers}" readonly="true" style="text-align:right;">
                                        <jsp:include flush="true" page="/commun/formatNombreStructure.jsp"/>
                                    </h:inputText>
                                </h:column>
                            </h:panelGrid>
                        </h:panelGrid>
                    </rich:tab>

                    <rich:tab id="tabDecriptionSejourSortie" label="Séjour Sortie" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.quitterSejour}">
                        <h:panelGrid width="100%" columns="2" columnClasses="clos25,clos75" styleClass="fichefournisseur" id="idMotif2">
                            <h:column><h:outputText value="Date sortie:"/></h:column>
                            <h:column>
                                <rich:calendar value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationSejour.hossejDateSortie}"  inputSize="8"  enableManualInput="false" datePattern="dd/MM/yyyy"  locale="fr" style=" background-color:white;" disabled="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosEtat>=2}">
                                    <a4j:support eventsQueue="maQueue" event="onchanged" reRender="idNbJour,idPP,idPT" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.calculenbJourSejour}"/>
                                </rich:calendar>&nbsp;&nbsp;
                                <h:column>
                                    <h:panelGrid  columns="4">
                                        <h:column>
                                            <h:selectOneMenu value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.var_heureDeces}" disabled="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosEtat>=2}">
                                                <f:selectItems value="#{bakingbeanepegase.menuModuleHorizontalCtrl.mesHeuresGlobalItems}" />
                                            </h:selectOneMenu>
                                        </h:column>
                                        <h:column>h</h:column>
                                        <h:column>
                                            <h:selectOneMenu  value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.var_minuteDeces}" disabled="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosEtat>=2}">
                                                <f:selectItems value="#{bakingbeanepegase.menuModuleHorizontalCtrl.mesMinutesGlobalItems}" />
                                            </h:selectOneMenu>
                                        </h:column>
                                        <h:column>mn</h:column>
                                    </h:panelGrid>
                                </h:column>
                            </h:column>
                            <h:column><h:outputText value="Mode sortie:" style="text-decoration:underline;"/></h:column>
                            <h:column>
                                <h:selectOneMenu style="width:100%" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationSejour.hossejMotifSortie}" disabled="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosEtat>=2}">
                                    <f:selectItem itemLabel="Sélection Mode sortie" itemValue=""/>
                                    <f:selectItems value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.lesMotifsSortieItems}"/>
                                    <a4j:support eventsQueue="maQueue" event="onchange" reRender="idMotif2,idDestin1,idDestin2"/>
                                </h:selectOneMenu>
                            </h:column>
                            <h:column><h:outputText id="idDestin1" value="Destination:" style="text-decoration:underline;" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationSejour.hossejMotifSortie!='8'&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationSejour.hossejMotifSortie!='9'}"/></h:column>
                            <h:column>
                                <h:selectOneMenu id="idDestin2" style="width:100%" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationSejour.hossejDestination}" disabled="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosEtat>=2}" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationSejour.hossejMotifSortie!='8'&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationSejour.hossejMotifSortie!='9'}">
                                    <f:selectItem itemLabel="Sélection Destination" itemValue=""/>
                                    <f:selectItems value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.lesDestinationsItems}"/>
                                </h:selectOneMenu>
                            </h:column>
                            <h:column><h:outputText value="Nb jours réels:"/></h:column>
                            <h:column><h:inputText id="idNbJour" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationSejour.hossejNbJour}" readonly="true" style="text-align:right;"/></h:column>
                        </h:panelGrid>
                    </rich:tab>

                    <rich:tab id="tabCodification" label="Codification" >
                        <h:panelGrid width="100%" columns="2" columnClasses="clos20,clos80" styleClass="fichefournisseur" id="idDiagnostics">
                            <h:column><h:outputText value="Diagnostic principal:" style="text-decoration:underline;"/></h:column>
                            <h:column>
                                <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationSejour.hossejCodeDiag1}" style="width:100px" disabled="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosEtat>=2}">
                                    <rich:toolTip followMouse="true" direction="top-right" showDelay="1000" value="chaine = Recherche qui commence... / *chaine = Recherche qui contient... / * = Recherche tous les diagnostics" style="background-color:#FFF8D4;"/>
                                    <a4j:support eventsQueue="maQueue" event="onchange" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.rechercheDiagnostic1}" onsubmit="javascript:Richfaces.showModalPanel('modAttente');" oncomplete="javascript:Richfaces.hideModalPanel('modAttente');" reRender="modAttente,panelDiagnostic,formModalpanelDiagnostic"/>
                                </h:inputText>&nbsp;&nbsp;
                                <h:inputText id="lib1" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationSejour.lib_diag1}" style="width:80%" readonly="true"/>
                            </h:column>
                            <h:column><h:outputText value="Diagnostic relié:" style="text-decoration:underline;"/></h:column>
                            <h:column>
                                <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationSejour.hossejCodeDiag2}" style="width:100px" disabled="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosEtat>=2}">
                                    <rich:toolTip followMouse="true" direction="top-right" showDelay="1000" value="chaine = Recherche qui commence... / *chaine = Recherche qui contient... / * = Recherche tous les diagnostics" style="background-color:#FFF8D4;"/>
                                    <a4j:support eventsQueue="maQueue" event="onchange" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.rechercheDiagnostic2}" onsubmit="javascript:Richfaces.showModalPanel('modAttente');" oncomplete="javascript:Richfaces.hideModalPanel('modAttente');" reRender="modAttente,panelDiagnostic,formModalpanelDiagnostic"/>
                                </h:inputText>&nbsp;&nbsp;
                                <h:inputText id="lib2" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationSejour.lib_diag2}" style="width:80%" readonly="true"/>
                            </h:column>
                        </h:panelGrid>
                        <h:panelGrid width="100%" columns="2" columnClasses="clos20,clos80" styleClass="fichefournisseur1">
                            <h:column><h:outputText value="Diagnostic associé 1:" style="text-decoration:underline;"/></h:column>
                            <h:column>
                                <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationSejour.hossejCodeDiag11}" style="width:100px" disabled="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosEtat>=2}">
                                    <rich:toolTip followMouse="true" direction="top-right" showDelay="1000" value="chaine = Recherche qui commence... / *chaine = Recherche qui contient... / * = Recherche tous les diagnostics" style="background-color:#FFF8D4;"/>
                                    <a4j:support eventsQueue="maQueue" event="onchange" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.rechercheDiagnostic11}" onsubmit="javascript:Richfaces.showModalPanel('modAttente');" oncomplete="javascript:Richfaces.hideModalPanel('modAttente');" reRender="modAttente,panelDiagnostic,formModalpanelDiagnostic"/>
                                </h:inputText>&nbsp;&nbsp;
                                <h:inputText id="lib11" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationSejour.lib_diag11}" style="width:80%" readonly="true"/>
                            </h:column>
                            <h:column><h:outputText value="Diagnostic associé 2:" style="text-decoration:underline;"/></h:column>
                            <h:column>
                                <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationSejour.hossejCodeDiag12}" style="width:100px"disabled="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosEtat>=2}">
                                    <rich:toolTip followMouse="true" direction="top-right" showDelay="1000" value="chaine = Recherche qui commence... / *chaine = Recherche qui contient... / * = Recherche tous les diagnostics" style="background-color:#FFF8D4;" />
                                    <a4j:support eventsQueue="maQueue" event="onchange" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.rechercheDiagnostic12}" onsubmit="javascript:Richfaces.showModalPanel('modAttente');" oncomplete="javascript:Richfaces.hideModalPanel('modAttente');" reRender="modAttente,panelDiagnostic,formModalpanelDiagnostic"/>
                                </h:inputText>&nbsp;&nbsp;
                                <h:inputText id="lib12" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationSejour.lib_diag12}" style="width:80%" readonly="true"/>
                            </h:column>
                            <h:column><h:outputText value="Diagnostic associé 3:" style="text-decoration:underline;"/></h:column>
                            <h:column>
                                <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationSejour.hossejCodeDiag13}" style="width:100px" disabled="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosEtat>=2}">
                                    <rich:toolTip followMouse="true" direction="top-right" showDelay="1000" value="chaine = Recherche qui commence... / *chaine = Recherche qui contient... / * = Recherche tous les diagnostics" style="background-color:#FFF8D4;"/>
                                    <a4j:support eventsQueue="maQueue" event="onchange" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.rechercheDiagnostic13}" onsubmit="javascript:Richfaces.showModalPanel('modAttente');" oncomplete="javascript:Richfaces.hideModalPanel('modAttente');" reRender="modAttente,panelDiagnostic,formModalpanelDiagnostic"/>
                                </h:inputText>&nbsp;&nbsp;
                                <h:inputText id="lib13" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationSejour.lib_diag13}" style="width:80%" readonly="true"/>
                            </h:column>
                            <h:column><h:outputText value="Diagnostic associé 4:" style="text-decoration:underline;"/></h:column>
                            <h:column>
                                <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationSejour.hossejCodeDiag14}" style="width:100px" disabled="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosEtat>=2}">
                                    <rich:toolTip followMouse="true" direction="top-right" showDelay="1000" value="chaine = Recherche qui commence... / *chaine = Recherche qui contient... / * = Recherche tous les diagnostics" style="background-color:#FFF8D4;"/>
                                    <a4j:support eventsQueue="maQueue" event="onchange" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.rechercheDiagnostic14}" onsubmit="javascript:Richfaces.showModalPanel('modAttente');" oncomplete="javascript:Richfaces.hideModalPanel('modAttente');" reRender="modAttente,panelDiagnostic,formModalpanelDiagnostic"/>
                                </h:inputText>&nbsp;&nbsp;
                                <h:inputText id="lib14" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationSejour.lib_diag14}" style="width:80%" readonly="true"/>
                            </h:column> 
                            <h:column><h:outputText value="Diagnostic associé 5:" style="text-decoration:underline;"/></h:column>
                            <h:column>
                                <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationSejour.hossejCodeDiag15}" style="width:100px" disabled="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosEtat>=2}">
                                    <rich:toolTip followMouse="true" direction="top-right" showDelay="1000" value="chaine = Recherche qui commence... / *chaine = Recherche qui contient... / * = Recherche tous les diagnostics" style="background-color:#FFF8D4;"/>
                                    <a4j:support eventsQueue="maQueue" event="onchange" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.rechercheDiagnostic15}" onsubmit="javascript:Richfaces.showModalPanel('modAttente');" oncomplete="javascript:Richfaces.hideModalPanel('modAttente');" reRender="modAttente,panelDiagnostic,formModalpanelDiagnostic"/>
                                </h:inputText>&nbsp;&nbsp;
                                <h:inputText id="lib15" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationSejour.lib_diag15}" style="width:80%" readonly="true"/>
                            </h:column>
                        </h:panelGrid>
                    </rich:tab>

                </rich:tabPanel>
                <br>
                <h:panelGroup id="valprd1">
                    <center>
                        <a4j:commandButton image="/images/annuler_big.png" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.annulerSejour}" reRender="panelSejour,btnSejour,btnConsultation,tableConsultation,btnActe,tableActes,btnOrdo,tableMedi,btnLabo,tableLabo,btnPrest,tablePrest"/>&nbsp;&nbsp;&nbsp;
                        <a4j:commandButton image="/images/valider_big.png" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.validerSejour}" reRender="panelSejour,tableSejour,btnSejour,btnConsultation,tableConsultation,btnActe,tableActes,btnOrdo,tableMedi,btnLabo,tableLabo,btnPrest,tablePrest,idTotalListe1,idTotalListe2,idTotalListe3,idTotalListe4,idTotalListe5,gridTotal" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.valideSejour}"/>
                    </center>
                </h:panelGroup>
            </a4j:form>
        </c:if>
    </rich:modalPanel>


    <rich:modalPanel domElementAttachment="parent"  id="panelActes" headerClass="headerPanel" style="border:solid 1px black;background-color:white;border-radius:10px;box-shadow: 10px 10px 2px 1px rgba(0,0,0,0.5);" width="800" height="400" showWhenRendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.showModalPanelActes}">
        <c:if test="${bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.showModalPanelActes}" var="act">
            <f:facet name="header"><h:outputText value="Définition des actes"/></f:facet>
            <a4j:form id="formModalActes">
                <rich:hotKey key="return" handler="return false;"/>
                <h:panelGrid width="100%" id="idPanActes">
                    <h:panelGrid width="100%" columns="2" columnClasses="clos25,clos75" styleClass="fichefournisseur">
                        <h:column><h:outputText value="Séjour:"/></h:column>
                        <h:column>
                            <h:selectOneMenu style="width:100%" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationActes.hosactIdSejour}">
                                <f:selectItem itemLabel="Sélection Séjour" itemValue="0"/>
                                <f:selectItems value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.mesSejoursItems}"/>
                                <a4j:support eventsQueue="maQueue" event="onchange" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.calculMedecinActe}" reRender="idMedecinActe,idPanActes"/>
                            </h:selectOneMenu>
                        </h:column>
                        <h:column><h:outputText value="Médecin:"/></h:column>
                        <h:column>
                            <h:selectOneMenu id="idMedecinActe" style="width:100%" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationActes.hosactIdMedecin}">
                                <f:selectItem itemLabel="Sélection Médecin" itemValue="0"/>
                                <f:selectItems value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.mesMedecinsItem}"/>
                                <a4j:support eventsQueue="maQueue" event="onchange" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.verifValideActe}" reRender="valActes,idPanActes"/>
                            </h:selectOneMenu>
                        </h:column>
                    </h:panelGrid>
                    <br>
                    <h:panelGrid columns="2" width="100%" id="ligne" columnClasses="clos25,clos75" styleClass="fichefournisseur">
                        <h:column><h:outputText value="Code:" style="text-decoration:underline;"/></h:column>
                        <h:column>
                            <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationActes.hosactProduit}" style="width:150px">
                                <rich:toolTip id="tooladdPrd" followMouse="true" direction="top-right" showDelay="1000" value="chaine = Recherche qui commence... / *chaine = Recherche qui contient... / * = Recherche tous les actes" style="background-color:#FFF8D4;"/>
                                <a4j:support eventsQueue="maQueue" event="onchange" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.rechercheActes}" onsubmit="javascript:Richfaces.showModalPanel('modAttente');" oncomplete="javascript:Richfaces.hideModalPanel('modAttente');" reRender="modAttente,panelListeActes,formModalListeActes,ligne,ligneSuite,valActes,idPanActes,valActes"/>
                            </h:inputText>
                        </h:column>
                        <h:column><h:outputText value="Libellé:"/></h:column>
                        <h:column><h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationActes.hosactLibelle}" readonly="true" style="width:100%"/></h:column>
                        <h:column><h:outputText value="Service facturé:" style="text-decoration:underline;"/></h:column>
                        <h:column>
                            <h:selectOneMenu value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationActes.hosactService}" style="width:100%" >
                                <f:selectItems value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.mesServicesFacturesActes}"/>
                            </h:selectOneMenu>
                        </h:column>
                        <h:column><h:outputText value="Lettre:" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationActes.hosactNb!=0}"/></h:column>
                        <h:column>
                            <h:selectOneMenu id="idLettre" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationActes.hosactLettre}" disabled="true" style="width:150px;" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationActes.hosactNb!=0}">
                                <f:selectItems value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.mesLettresItems}"/>
                            </h:selectOneMenu>
                        </h:column>
                        <h:column><h:outputText value="Nb:" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationActes.hosactNb!=0}"/></h:column>
                        <h:column><h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationActes.hosactNb}" disabled="true" style="width:80px;text-align:right;" readonly="true" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationActes.hosactNb!=0}"/></h:column>
                        <h:column><h:outputText value="Valeur:"/></h:column>
                        <h:panelGroup id="puval" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationActes.hosactNb!=0}">
                            <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationActes.hosactValeur}"  disabled="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.verrouPrvente&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationActes.hosactValeur!=0}" style="width:100px;text-align:right;" onkeypress="return scanToucheChiffre(event)">
                                <jsp:include flush="true" page="/commun/formatNombreStructure.jsp"/>
                            </h:inputText>
                        </h:panelGroup>
                        <h:panelGroup id="pu" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationActes.hosactNb==0}">
                            <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationActes.hosactPu}" disabled="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.verrouPrvente&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationActes.hosactPu!=0}" style="width:100px;text-align:right;" onkeypress="return scanToucheChiffre(event)">
                                <jsp:include flush="true" page="/commun/formatNombreStructure.jsp"/>
                            </h:inputText>
                        </h:panelGroup>

                        <h:column rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.usersLog.usrVerRemise==0}"><h:outputText value="Rem."/></h:column>
                        <h:column rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.usersLog.usrVerRemise==0}">
                            <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationActes.hosactRemise}" style="width:50px;text-align:right;" onkeypress="return scanToucheChiffre(event)">
                                <f:convertNumber groupingUsed="true" locale="FR" minFractionDigits="2" maxFractionDigits="2"/>
                            </h:inputText>
                        </h:column>
                        <h:column rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.usersLog.usrVerRabais==0}"><h:outputText value="Rab."/></h:column>
                        <h:column rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.usersLog.usrVerRabais==0}">
                            <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationActes.hosactRabais}" style="width:50px;text-align:right;" onkeypress="return scanToucheChiffre(event)">
                                <jsp:include flush="true" page="/commun/formatNombreStructure.jsp"/>
                            </h:inputText>
                        </h:column>

                        <h:column><h:outputText value="Qte:"/></h:column>
                        <h:column>
                            <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationActes.hosactQte}" style="width:80px;text-align:right;" onkeypress="return scanToucheChiffre(event)">
                                <a4j:support eventsQueue="maQueue" event="onblur" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.verifValideActe}" reRender="valActes,idPanActes"/>
                            </h:inputText>
                        </h:column>
                    </h:panelGrid>
                    <h:panelGrid columns="4" width="100%" id="ligneSuite" columnClasses="clos25,clos12c,clos12c,clos12c" styleClass="fichefournisseur">
                        <h:column><h:outputText value=""/></h:column>
                        <h:column rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.presenceActeLie}"><h:outputText value="Acte lié: #{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.nomActeLie}"/></h:column>
                        <h:column rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.presenceActeLie}"><h:outputText value="Qte:"/></h:column>
                        <h:column rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.presenceActeLie}"><h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.qteActeLie}" style="width:80px;text-align:right;" onkeypress="return scanToucheChiffre(event)"/></h:column>
                    </h:panelGrid>
                    <br>
                    <h:panelGroup id="valActes">
                        <center>
                            <a4j:commandButton image="/images/annuler_big.png" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.fermerActes}" reRender="panelActes,btnActe"/>&nbsp;&nbsp;&nbsp;
                            <a4j:commandButton image="/images/valider_big.png" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.saveActe}" reRender="panelActes,tableActes,btnActe,idTotalListe1,idTotalListe2,idTotalListe3,idTotalListe4,idTotalListe5,gridTotal" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.valideActe}"/>
                        </center>
                    </h:panelGroup>
                </h:panelGrid>
            </a4j:form>
        </c:if>
    </rich:modalPanel>


    <rich:modalPanel id="panelListeActes" headerClass="headerPanel" style="border:solid 1px black;background-color:white;border-radius:10px;box-shadow: 10px 10px 2px 1px rgba(0,0,0,0.5);" width="1000" height="500" showWhenRendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.showModalPanelListeActes}">
        <c:if test="${bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.showModalPanelListeActes}" var="act">
            <f:facet name="header"><h:outputText value="Sélection de l'acte (CCAM)"/></f:facet>
            <a4j:form id="formModalListeActes">
                <rich:hotKey key="return" handler="return false;"/>
                <rich:tabPanel switchType="client" immediate="true" style="border:0px;">

                    <rich:tab id="ccam" label="Code CCAM" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.afficheActeCCAM}">
                        <a4j:region renderRegionOnly="false">
                            <rich:datascroller renderIfSinglePage="false" pageIndexVar="pageIndex" pagesVar="pages" id="scrollTable4" maxPages="20"align="left" for="tableActesCCAM"/>
                            <rich:extendedDataTable rows="200" id="tableActesCCAM" footerClass="bard" headerClass="headerTab" activeClass="active-row" noDataLabel=" " border="0" width="100%" height="330px" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.datamodelProduitsCCAM}" var="prdact" activeRowKey="true" rowKeyVar="rkv" selection="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.simpleSelectionCCAM}" sortMode="multi" selectionMode="single" binding="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.extDTableCCAM}">
                                <a4j:support eventsQueue="maQueue" event="onselectionchange" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.selectionActesCCAM}" reRender="idValAct1"/>
                                <rich:column label="Code de l'acte" sortable="true" sortBy="#{prdact.ccamDetCode}" width="10%">
                                    <f:facet name="header"><h:outputText  value="Code" /></f:facet>
                                    <h:outputText value="#{prdact.ccamDetCode}"/>
                                </rich:column>
                                <rich:column label="Libellé de l'acte" sortable="true" sortBy="#{prdact.ccamDetLibFr}" width="30%">
                                    <f:facet name="header"><h:outputText  value="Libellé" /></f:facet>
                                    <h:inputTextarea value="#{prdact.ccamDetLibFr}" readonly="true" rows="2" style="width:100%"/>
                                </rich:column>
                                <rich:column label="Famille" sortable="true" sortBy="#{prdact.ccamFamLibFr}" width="20%">
                                    <f:facet name="header"><h:outputText  value="Famille" /></f:facet>
                                    <h:inputTextarea value="#{prdact.ccamFamLibFr}" readonly="true" rows="2" style="width:100%"/>
                                </rich:column>
                                <rich:column label="Sous famille" sortable="true" sortBy="#{prdact.ccamSfamLibFr}" width="20%">
                                    <f:facet name="header"><h:outputText  value="Sous famille" /></f:facet>
                                    <h:inputTextarea value="#{prdact.ccamSfamLibFr}" readonly="true" rows="2" style="width:100%"/>
                                </rich:column>
                                <rich:column label="Sous Sous famille" sortable="true" sortBy="#{prdact.ccamSsfamLibFr}" width="20%">
                                    <f:facet name="header"><h:outputText  value="Sous Sous famille" /></f:facet>
                                    <h:inputTextarea value="#{prdact.ccamSsfamLibFr}" readonly="true" rows="2" style="width:100%"/>
                                </rich:column>
                            </rich:extendedDataTable>
                        </a4j:region>
                        <br>
                        <h:panelGroup id="idValAct1">
                            <center>
                                <a4j:commandButton image="/images/annuler_big.png" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.annuleActes}" reRender="panelListeActes,ligne,valActes"/>&nbsp;&nbsp;&nbsp;
                                <a4j:commandButton image="/images/valider_big.png" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.valideActes}" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.ccamMedical.ccamId!=0}" reRender="panelListeActes,ligne,ligneSuite,panelCreationProduit,valActes"/>
                            </center>
                        </h:panelGroup>

                    </rich:tab>

                    <rich:tab id="perso" label="Code Personnel" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.afficheActeCP}">
                        <a4j:region renderRegionOnly="false">
                            <rich:datascroller renderIfSinglePage="false" pageIndexVar="pageIndex" pagesVar="pages" id="scrollTable5" maxPages="20"align="left" for="tableActesCP"/>
                            <rich:extendedDataTable rows="200" id="tableActesCP" footerClass="bard" headerClass="headerTab" activeClass="active-row" noDataLabel=" " border="0" width="100%" height="330px" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.datamodelProduits}"  var="prd" activeRowKey="true" rowKeyVar="rkv" selection="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.simpleSelectionProduits}" sortMode="multi" selectionMode="single" binding="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.extDTableProduits}">
                                <a4j:support eventsQueue="maQueue" event="onselectionchange" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.selectionActesCP}" reRender="idValAct2"/>
                                <rich:column label="Famille" sortable="true" sortBy="#{prd.proVteLib}" width="20%">
                                    <f:facet name="header"><h:outputText  value="Famille" /></f:facet>
                                    <h:outputText value="#{prd.proVteLib}"/>
                                </rich:column>
                                <rich:column label="Code" sortable="true" sortBy="#{prd.proCode}" width="10%">
                                    <f:facet name="header"><h:outputText  value="Code" /></f:facet>
                                    <h:outputText value="#{prd.proCode}"/>
                                </rich:column>
                                <rich:column label="Libellé produit" sortable="true" sortBy="#{prd.proLibClient}" width="70%">
                                    <f:facet name="header"><h:outputText  value="Libellé produit" /></f:facet>
                                    <h:inputTextarea value="#{prd.proLibClient}" readonly="true" rows="2" style="width:100%"/>
                                </rich:column>
                            </rich:extendedDataTable>
                        </a4j:region>
                        <br>
                        <h:panelGroup id="idValAct2">
                            <center>
                                <a4j:commandButton image="/images/annuler_big.png" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.annuleActes}" reRender="panelListeActes,ligne,valActes"/>&nbsp;&nbsp;&nbsp;
                                <a4j:commandButton image="/images/valider_big.png" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.valideActes}" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.produits.proId!=0}" reRender="panelListeActes,ligne,ligneSuite,panelCreationProduit,valActes"/>
                            </center>
                        </h:panelGroup>

                    </rich:tab>

                </rich:tabPanel>
            </a4j:form>
        </c:if>
    </rich:modalPanel>


    <rich:modalPanel id="panelCreationProduit" headerClass="headerPanel" width="800" height="550" style="border:solid 1px black;background-color:white;border-radius:10px;box-shadow: 10px 10px 2px 1px rgba(0,0,0,0.5);" showWhenRendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.showModalPanelCreationActe}">
        <c:if test="${bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.showModalPanelCreationActe}" var="detprd">
            <f:facet name="header"><h:outputText value="CREATION DU PRODUIT"></h:outputText></f:facet>
            <a4j:form>
                <rich:hotKey key="return" handler="return false;"/>
                <h:panelGrid  width="100%" id="formModalCreationProduit">
                    <h:panelGrid columns="2" columnClasses="clos25,clos75" width="100%">
                        <h:column><h:outputText value="Code CCAM:"/></h:column>
                        <h:column><h:inputText style="width:100%;" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.ccamMedical.ccamDetCode}" readonly="true" disabled="true"/></h:column>
                        <h:column><h:outputText value="Libellé CCAM:"/></h:column>
                        <h:column><h:inputTextarea style="width:100%;" rows="3" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.ccamMedical.ccamDetLibFr}" readonly="true" disabled="true"/></h:column>
                        <h:column><h:outputText value="Libellé Produit:"/></h:column>
                        <h:column><h:inputTextarea style="width:100%;" rows="3" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.produits.proLibClient}"/></h:column>
                        <h:column><h:outputText value="Famille:"/></h:column>
                        <h:column>
                            <h:selectOneMenu id="idFamille" style="width:600px" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.inpCodeFamille}">
                                <f:selectItems value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.mesFamillesActesItems}"/>
                                <a4j:support eventsQueue="maQueue"  event="onchange" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.calculeFamille}" reRender="idValProduit"/>
                            </h:selectOneMenu>
                        </h:column>
                        <h:column><h:outputText value="Lettre:"/></h:column>
                        <h:column>
                            <h:selectOneMenu id="idLettre" style="width:600px" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.lettreActe}">
                                <f:selectItem itemLabel="Sélectionnez une lettre" itemValue="0"/>
                                <f:selectItems value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.mesLettresItems}"/>
                                <a4j:support eventsQueue="maQueue" event="onchange" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.calculeTarif}" reRender="tableTarif,idValProduit" />
                            </h:selectOneMenu>
                        </h:column>
                        <h:column><h:outputText value="Nombre de Lettres:"/></h:column>
                        <h:column><h:inputText style="width:50%;" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.produits.proNbUnite}"/></h:column>
                        <h:column><h:outputText value="Tarification:"/></h:column>
                        <h:column>
                            <a4j:region renderRegionOnly="false">
                                <rich:extendedDataTable id="tableTarif" enableContextMenu="false" footerClass="bard" headerClass="headerTab" activeClass="active-row" noDataLabel=" " border="0" width="100%" height="200px" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.lesTarifs}" var="prdtar">
                                    <rich:column label="Catégorie" sortable="false" width="70%">
                                        <f:facet name="header"><h:outputText  value="Catégorie" /></f:facet>
                                        <h:outputText value="#{prdtar.protarOrdre} #{prdtar.protarClient}"/>
                                    </rich:column>
                                    <rich:column label="Coefficient" sortable="false" width="10%">
                                        <f:facet name="header"><h:outputText  value="Coef." /></f:facet>
                                        <h:inputText value="#{prdtar.protarCoef}">
                                            <f:convertNumber groupingUsed="true" locale="FR" minFractionDigits="2" maxFractionDigits="2"/>
                                        </h:inputText>
                                    </rich:column>
                                    <rich:column label="Prix unitaire" sortable="false" width="20%" style="text-align:right;">
                                        <f:facet name="header"><h:outputText  value="Valeur" /></f:facet>
                                        <h:inputText value="#{prdtar.protarPv}" readonly="true" style="text-align:right;width:90%">
                                            <jsp:include flush="true" page="/commun/formatNombreStructure.jsp"/>
                                        </h:inputText>
                                    </rich:column>
                                </rich:extendedDataTable>
                            </a4j:region>
                        </h:column>
                    </h:panelGrid>
                </h:panelGrid>
                <br>
                <h:panelGroup id="idValProduit">
                    <center>
                        <a4j:commandButton image="/images/annuler_big.png" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.fermerValidesProduit}" reRender="panelCreationProduit,valActes"/>&nbsp;&nbsp;&nbsp;
                        <a4j:commandButton image="/images/valider_big.png" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.validesProduit}" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.produits.proVteCode!=null&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.lettreActe!=null}" reRender="panelCreationProduit,panelListeActes,ligne,valActes"/>
                    </center>
                </h:panelGroup>
            </a4j:form>
        </c:if>
    </rich:modalPanel>


    <rich:modalPanel domElementAttachment="parent"  id="panelMedi" headerClass="headerPanel" style="border:solid 1px black;background-color:white;border-radius:10px;box-shadow: 10px 10px 2px 1px rgba(0,0,0,0.5);" width="800" height="400" showWhenRendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.showModalPanelMedi}">
        <c:if test="${bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.showModalPanelMedi}" var="med">
            <f:facet name="header"><h:outputText value="Définition des médicamments"/></f:facet>
            <a4j:form id="formModalMedi">
                <rich:hotKey key="return" handler="return false;"/>
                <h:panelGrid width="100%" id="idPanMedi">
                    <h:panelGrid width="100%" columns="2" columnClasses="clos25,clos75" styleClass="fichefournisseur">
                        <h:column><h:outputText value="Séjour:"/></h:column>
                        <h:column>
                            <h:selectOneMenu style="width:100%" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationMedi.hosmedIdSejour}">
                                <f:selectItem itemLabel="Sélection Séjour" itemValue="0"/>
                                <f:selectItems value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.mesSejoursItems}"/>
                                <a4j:support eventsQueue="maQueue" event="onchange" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.calculMedecinMedi}" reRender="idMedecinMedi,idPanMedi"/>
                            </h:selectOneMenu>
                        </h:column>
                        <h:column><h:outputText value="Médecin:"/></h:column>
                        <h:column>
                            <h:selectOneMenu id="idMedecinMedi" style="width:100%" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationMedi.hosmedIdMedecin}">
                                <f:selectItem itemLabel="Sélection Médecin" itemValue="0"/>
                                <f:selectItems value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.mesMedecinsItem}"/>
                                <a4j:support eventsQueue="maQueue" event="onchange" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.verifValideMedicamment}" reRender="valMedi,idPanMedi"/>
                            </h:selectOneMenu>
                        </h:column>
                    </h:panelGrid>
                    <br>
                    <h:panelGrid columns="2" width="100%" id="ligne1" columnClasses="clos25,clos75" styleClass="fichefournisseur">
                        <h:column><h:outputText value="Code produit:" style="text-decoration:underline;"/></h:column>
                        <h:column>
                            <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationMedi.hosmedProduit}" style="width:150px">
                                <rich:toolTip id="tooladdPrd" followMouse="true" direction="top-right" showDelay="1000" value="chaine = Recherche qui commence... / *chaine = Recherche qui contient... / * = Recherche tous les actes" style="background-color:#FFF8D4;"/>
                                <a4j:support eventsQueue="maQueue" event="onchange" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.rechercheMedicamment}" onsubmit="javascript:Richfaces.showModalPanel('modAttente');" oncomplete="javascript:Richfaces.hideModalPanel('modAttente');" reRender="modAttente,panelListeProduits,formModalListeProduits,ligne1,valMedi,idPanMedi"/>
                            </h:inputText>
                        </h:column>
                        <h:column><h:outputText value="Libellé:"/></h:column>
                        <h:column><h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationMedi.hosmedLibelle}" readonly="true" style="width:100%"/></h:column>
                        <h:column><h:outputText value="Service facturé:" style="text-decoration:underline;"/></h:column>
                        <h:column>
                            <h:selectOneMenu value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationMedi.hosmedService}" style="width:100%">
                                <f:selectItems value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.mesServicesFacturesMedi}"/>
                            </h:selectOneMenu>
                        </h:column>
                        <h:column><h:outputText value="Dépot:" style="text-decoration:underline;"/></h:column>
                        <h:column>
                            <h:selectOneMenu value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.medicDepot}" style="width:150px;">
                                <f:selectItems value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.mesDepotsItems}"/>
                            </h:selectOneMenu>
                        </h:column>
                        <h:column><h:outputText value="Prix unitaire:"/></h:column>
                        <h:column>
                            <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationMedi.hosmedPu}" disabled="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.verrouPrvente&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationMedi.hosmedPu!=0}" style="width:100px;text-align:right;" onkeypress="return scanToucheChiffre(event)">
                                <jsp:include flush="true" page="/commun/formatNombreStructure.jsp"/>
                            </h:inputText>
                        </h:column>

                        <h:column rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.usersLog.usrVerRemise==0}"><h:outputText value="Rem."/></h:column>
                        <h:column rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.usersLog.usrVerRemise==0}">
                            <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationMedi.hosmedRemise}" style="width:50px;text-align:right;" onkeypress="return scanToucheChiffre(event)">
                                <f:convertNumber groupingUsed="true" locale="FR" minFractionDigits="2" maxFractionDigits="2"/>
                            </h:inputText>
                        </h:column>
                        <h:column rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.usersLog.usrVerRabais==0}"><h:outputText value="Rab."/></h:column>
                        <h:column rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.usersLog.usrVerRabais==0}">
                            <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationMedi.hosmedRabais}" style="width:50px;text-align:right;" onkeypress="return scanToucheChiffre(event)">
                                <jsp:include flush="true" page="/commun/formatNombreStructure.jsp"/>
                            </h:inputText>
                        </h:column>

                        <h:column><h:outputText value="Qte:"/></h:column>
                        <h:column>
                            <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationMedi.hosmedQte}" style="width:80px;text-align:right;" onkeypress="return scanToucheChiffre(event)">
                                <a4j:support eventsQueue="maQueue" event="onblur" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.verifValideMedicamment}" reRender="valMedi,idPanMedi"/>
                            </h:inputText>
                        </h:column>
                    </h:panelGrid>
                    <br>
                    <h:panelGroup id="valMedi">
                        <center>
                            <a4j:commandButton image="/images/annuler_big.png" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.fermerMedicamment}" reRender="panelMedi,btnOrdo"/>&nbsp;&nbsp;&nbsp;
                            <a4j:commandButton image="/images/valider_big.png" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.saveMedicamment}" reRender="panelMedi,tableMedi,btnOrdo,idTotalListe1,idTotalListe2,idTotalListe3,idTotalListe4,idTotalListe5,gridTotal" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.valideMedi}"/>
                        </center>
                    </h:panelGroup>
                </h:panelGrid>
            </a4j:form>
        </c:if>
    </rich:modalPanel>


    <rich:modalPanel domElementAttachment="parent"  id="panelLabo" headerClass="headerPanel" style="border:solid 1px black;background-color:white;border-radius:10px;box-shadow: 10px 10px 2px 1px rgba(0,0,0,0.5);" width="800" height="600" showWhenRendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.showModalPanelLabo}">
        <c:if test="${bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.showModalPanelLabo}" var="lab">
            <f:facet name="header"><h:outputText value="Définition des laboratoires"/></f:facet>
            <a4j:form id="formModalLabo">
                <rich:hotKey key="return" handler="return false;"/>
                <h:panelGrid width="100%" id="idPanLabo">
                    <h:panelGrid width="100%" columns="2" columnClasses="clos25,clos75" styleClass="fichefournisseur">
                        <h:column><h:outputText value="Séjour:"/></h:column>
                        <h:column>
                            <h:selectOneMenu style="width:100%" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationLabo.hoslabIdSejour}">
                                <f:selectItem itemLabel="Sélection Séjour" itemValue="0"/>
                                <f:selectItems value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.mesSejoursItems}"/>
                                <a4j:support eventsQueue="maQueue" event="onchange" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.calculMedecinLabo}" reRender="idMedecinLabo,idPanLabo"/>
                            </h:selectOneMenu>
                        </h:column>
                        <h:column><h:outputText value="Médecin:"/></h:column>
                        <h:column>
                            <h:selectOneMenu id="idMedecinLabo" style="width:100%" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationLabo.hoslabIdMedecin}">
                                <f:selectItem itemLabel="Sélection Médecin" itemValue="0"/>
                                <f:selectItems value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.mesMedecinsItem}"/>
                                <a4j:support eventsQueue="maQueue" event="onchange" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.verifValideLaboratoire}" reRender="valLabo,idPanLabo"/>
                            </h:selectOneMenu>
                        </h:column>
                    </h:panelGrid>
                    <br>
                    <h:panelGrid columns="2" width="100%" id="ligne2" columnClasses="clos25,clos75" styleClass="fichefournisseur">
                        <h:column><h:outputText value="Code examen:" style="text-decoration:underline;"/></h:column>
                        <h:column>
                            <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationLabo.hoslabProduit}" style="width:150px">
                                <rich:toolTip id="tooladdPrd" followMouse="true" direction="top-right" showDelay="1000" value="chaine = Recherche qui commence... / *chaine = Recherche qui contient... / * = Recherche tous les actes" style="background-color:#FFF8D4;"/>
                                <a4j:support eventsQueue="maQueue" event="onchange" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.rechercheLaboratoire}" onsubmit="javascript:Richfaces.showModalPanel('modAttente');" oncomplete="javascript:Richfaces.hideModalPanel('modAttente');" reRender="modAttente,panelListeProduits,formModalListeProduits,ligne2,valLabo,idPanLabo,idNomLabo,idForfait"/>
                            </h:inputText>
                        </h:column>
                        <h:column><h:outputText value="Laboratoire:"/></h:column>
                        <h:column>
                            <c:if test="${!bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.choixImputationLabo}" var="lab1">
                                <h:selectOneMenu id="idLaboratoireLigne1" style="width:100%" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationLabo.hoslabLaboratoire}" disabled="true">
                                    <f:selectItems value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.mesLaboratoiresItems}" />
                                </h:selectOneMenu>
                            </c:if>
                            <c:if test="${bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.choixImputationLabo}" var="lab2">
                                <h:selectOneMenu id="idLaboratoireLigne2" style="width:100%;color:red" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationLabo.hoslabLaboratoire}">
                                    <f:selectItems value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.mesImputationLabo}" />
                                </h:selectOneMenu>
                            </c:if>
                        </h:column>
                        <h:column><h:outputText value="Libellé:"/></h:column>
                        <h:column><h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationLabo.hoslabLibelle}" readonly="true" style="width:100%"/></h:column>
                        <h:column><h:outputText value="Service facturé:" style="text-decoration:underline;"/></h:column>
                        <h:column>
                            <h:selectOneMenu value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationLabo.hoslabService}" style="width:100%" >
                                <f:selectItems value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.mesServicesFacturesLabo}"/>
                            </h:selectOneMenu>
                        </h:column>
                        <h:column><h:outputText value="Prix unitaire:"/></h:column>
                        <h:column id="idForfait">
                            <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationLabo.hoslabPu}" disabled="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.verrouPrvente&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationLabo.hoslabPu!=0}" style="width:100px;text-align:right;" onkeypress="return scanToucheChiffre(event)">
                                <jsp:include flush="true" page="/commun/formatNombreStructure.jsp"/>
                            </h:inputText>
                        </h:column>

                        <h:column rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.usersLog.usrVerRemise==0}"><h:outputText value="Rem."/></h:column>
                        <h:column rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.usersLog.usrVerRemise==0}">
                            <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationLabo.hoslabRemise}" style="width:50px;text-align:right;" onkeypress="return scanToucheChiffre(event)">
                                <f:convertNumber groupingUsed="true" locale="FR" minFractionDigits="2" maxFractionDigits="2"/>
                            </h:inputText>
                        </h:column>
                        <h:column rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.usersLog.usrVerRabais==0}"><h:outputText value="Rab."/></h:column>
                        <h:column rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.usersLog.usrVerRabais==0}">
                            <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationLabo.hoslabRabais}" style="width:50px;text-align:right;" onkeypress="return scanToucheChiffre(event)">
                                <jsp:include flush="true" page="/commun/formatNombreStructure.jsp"/>
                            </h:inputText>
                        </h:column>

                        <h:column><h:outputText value="Qte:"/></h:column>
                        <h:column>
                            <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationLabo.hoslabQte}" style="width:80px;text-align:right;" onkeypress="return scanToucheChiffre(event)">
                                <a4j:support eventsQueue="maQueue" event="onblur" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.verifValideLaboratoire}" reRender="valLabo,idPanLabo"/>
                            </h:inputText>
                        </h:column>
                    </h:panelGrid>
                    <br>
                    <h:panelGrid width="100%" columns="4" columnClasses="clos15,clos35,clos15,clos35" styleClass="fichefournisseur" id="idpanQuestion">
                        <h:column><h:outputText value="Date prélèvement:"/></h:column>
                        <h:column><rich:calendar value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationLabo.hoslabDatePrelevement}"  inputSize="8" datePattern="dd/MM/yyyy HH:MM" locale="fr" style=" background-color:white;"  disabled="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.var_aff_action}"/></h:column>
                        <h:column><h:outputText value=""/></h:column>
                        <h:column><h:outputText value=""/></h:column>
                        <h:column><h:outputText value="Lieu prélèvement:"/></h:column>
                        <h:column>
                            <h:selectOneMenu style="width:100%" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationLabo.hoslabLieuPrelevement}" disabled="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.var_aff_action}">
                                <f:selectItem itemLabel="Non renseigné" itemValue="0"/>
                                <f:selectItem itemLabel="A domicile" itemValue="1"/>
                                <f:selectItem itemLabel="Au laboratoire" itemValue="2"/>
                                <f:selectItem itemLabel="Dans une unité de soin" itemValue="3"/>
                            </h:selectOneMenu>
                        </h:column>
                        <h:column><h:outputText value="Partenaire:"/></h:column>
                        <h:column>
                            <h:selectOneMenu style="width:100%" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationLabo.hoslabPartenaire}" disabled="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.var_aff_action}">
                                <f:selectItem itemLabel="Non renseigné" itemValue="0"/>
                                <f:selectItem itemLabel="Avec partenaire" itemValue="1"/>
                                <f:selectItem itemLabel="Avec plusieurs partenaires" itemValue="2"/>
                                <f:selectItem itemLabel="Sans partenaire" itemValue="3"/>
                            </h:selectOneMenu>
                        </h:column>
                        <h:column><h:outputText value="Date dernières règles:" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.patients.patSexe==0}"/></h:column>
                        <h:column><rich:calendar value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationLabo.hoslabDateRegles}"  inputSize="8"  enableManualInput="true" datePattern="dd/MM/yyyy"  locale="fr" style=" background-color:white;" disabled="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.var_aff_action}" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.patients.patSexe==0}"/></h:column>
                        <h:column><h:outputText value="Grossesse:" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.patients.patSexe==0}"/></h:column>
                        <h:column><h:selectBooleanCheckbox value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationLabo.hoslabGrossesse}" disabled="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.var_aff_action}" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.patients.patSexe==0}"/></h:column>
                        <h:column><h:outputText value="Diabète:"/></h:column>
                        <h:column><h:selectBooleanCheckbox value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationLabo.hoslabDiabete}" disabled="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.var_aff_action}"/></h:column>
                        <h:column><h:outputText value="Immuno-Déprimé(e):"/></h:column>
                        <h:column><h:selectBooleanCheckbox value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationLabo.hoslabImmunodepressif}" disabled="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.var_aff_action}"/></h:column>
                        <h:column><h:outputText value="Traitement en cours:"/></h:column>
                        <h:column>
                            <h:selectBooleanCheckbox value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationLabo.hoslabTraitement}" disabled="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.var_aff_action}">
                                <a4j:support eventsQueue="maQueue" event="onchange" reRender="idpanQuestion,idTrt1,idTrt2"/>
                            </h:selectBooleanCheckbox>
                        </h:column>
                        <h:column><h:outputText id="idTrt1" value="Quel traitement?:" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationLabo.hoslabTraitement==true}"/></h:column>
                        <h:column><h:inputText id="idTrt2" style="width:100%" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationLabo.hoslabLequel}" disabled="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.var_aff_action}" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationLabo.hoslabTraitement==true}"/></h:column>
                        <h:column><h:outputText value="Date résultat:" style="color:red"/></h:column>
                        <h:column><rich:calendar value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationLabo.hoslabDateResultat}"  inputSize="8" datePattern="dd/MM/yyyy HH:MM" locale="fr" style=" background-color:white;color:red"  disabled="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.var_aff_action}"/></h:column>
                        <h:column><h:outputText value="Urgence:" style="color:red"/></h:column>
                        <h:column>
                            <h:selectOneMenu style="width:100%;color:red" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationLabo.hoslabUrgent}" disabled="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.var_aff_action}">
                                <f:selectItem itemLabel="Normal" itemValue="0"/>
                                <f:selectItem itemLabel="Petite Urgence" itemValue="1"/>
                                <f:selectItem itemLabel="Urgence" itemValue="2"/>
                                <f:selectItem itemLabel="Extreme Urgence" itemValue="3"/>
                            </h:selectOneMenu>
                        </h:column>
                    </h:panelGrid>
                    <br>
                    <h:panelGroup id="valLabo">
                        <center>
                            <a4j:commandButton image="/images/annuler_big.png" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.fermerLaboratoire}" reRender="panelLabo,btnLabo"/>&nbsp;&nbsp;&nbsp;
                            <a4j:commandButton image="/images/valider_big.png" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.saveLaboratoire}" reRender="panelLabo,tableLabo,btnLabo,idTotalListe1,idTotalListe2,idTotalListe3,idTotalListe4,idTotalListe5,gridTotal" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.valideLabo}"/>
                        </center>
                    </h:panelGroup>
                </h:panelGrid>
            </a4j:form>
        </c:if>
    </rich:modalPanel>


    <rich:modalPanel domElementAttachment="parent"  id="panelPrest" headerClass="headerPanel" style="border:solid 1px black;background-color:white;border-radius:10px;box-shadow: 10px 10px 2px 1px rgba(0,0,0,0.5);" width="800" height="400" showWhenRendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.showModalPanelPrest}">
        <c:if test="${bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.showModalPanelPrest}" var="prt">
            <f:facet name="header"><h:outputText value="Définition des autres prestations"/></f:facet>
            <a4j:form id="formModalPrest">
                <rich:hotKey key="return" handler="return false;"/>
                <h:panelGrid width="100%" columns="2" columnClasses="clos25,clos75" styleClass="fichefournisseur">
                    <h:column><h:outputText value="Séjour:"/></h:column>
                    <h:column>
                        <h:selectOneMenu style="width:100%" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationPrest.hosprtIdSejour}">
                            <f:selectItem itemLabel="Sélection Séjour" itemValue="0"/>
                            <f:selectItems value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.mesSejoursItems}"/>
                            <a4j:support eventsQueue="maQueue" event="onchange" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.calculMedecinPrest}" reRender="idMedecinPrest"/>
                        </h:selectOneMenu>
                    </h:column>
                    <h:column><h:outputText value="Médecin:"/></h:column>
                    <h:column>
                        <h:selectOneMenu id="idMedecinPrest" style="width:100%" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationPrest.hosprtIdMedecin}">
                            <f:selectItem itemLabel="Sélection Médecin" itemValue="0"/>
                            <f:selectItems value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.mesMedecinsItem}"/>
                            <a4j:support eventsQueue="maQueue" event="onchange" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.verifValidePrestation}" reRender="valPrest"/>
                        </h:selectOneMenu>
                    </h:column>
                </h:panelGrid>
                <br>
                <h:panelGrid columns="2" width="100%" id="ligne3" columnClasses="clos25,clos75" styleClass="fichefournisseur">
                    <h:column><h:outputText value="Code produit:" style="text-decoration:underline;"/></h:column>
                    <h:column>
                        <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationPrest.hosprtProduit}" style="width:150px">
                            <rich:toolTip id="tooladdPrd" followMouse="true" direction="top-right" showDelay="1000" value="chaine = Recherche qui commence... / *chaine = Recherche qui contient... / * = Recherche tous les actes" style="background-color:#FFF8D4;"/>
                            <a4j:support eventsQueue="maQueue" event="onchange" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.recherchePrestation}" onsubmit="javascript:Richfaces.showModalPanel('modAttente');" oncomplete="javascript:Richfaces.hideModalPanel('modAttente');" reRender="modAttente,panelListeProduits,formModalListeProduits,ligne3,valPrest"/>
                        </h:inputText>
                    </h:column>
                    <h:column><h:outputText value="Libellé:"/></h:column>
                    <h:column><h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationPrest.hosprtLibelle}" readonly="true" style="width:100%"/></h:column>
                    <h:column><h:outputText value="Service facturé:" style="text-decoration:underline;"/></h:column>
                    <h:column>
                        <h:selectOneMenu value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationPrest.hosprtService}" style="width:100%">
                            <f:selectItems value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.mesServicesFacturesPrest}"/>
                        </h:selectOneMenu>
                    </h:column>
                    <h:column><h:outputText value="Prix unitaire:"/></h:column>
                    <h:column>
                        <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationPrest.hosprtPu}" disabled="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.verrouPrvente&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationPrest.hosprtPu!=0}" style="width:100px;text-align:right;" onkeypress="return scanToucheChiffre(event)">
                            <jsp:include flush="true" page="/commun/formatNombreStructure.jsp"/>
                        </h:inputText>
                    </h:column>

                    <h:column rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.usersLog.usrVerRemise==0}"><h:outputText value="Rem."/></h:column>
                    <h:column rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.usersLog.usrVerRemise==0}">
                        <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationPrest.hosprtRemise}" style="width:50px;text-align:right;" onkeypress="return scanToucheChiffre(event)">
                            <f:convertNumber groupingUsed="true" locale="FR" minFractionDigits="2" maxFractionDigits="2"/>
                        </h:inputText>
                    </h:column>
                    <h:column rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.usersLog.usrVerRabais==0}"><h:outputText value="Rab."/></h:column>
                    <h:column rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.usersLog.usrVerRabais==0}">
                        <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationPrest.hosprtRabais}" style="width:50px;text-align:right;" onkeypress="return scanToucheChiffre(event)">
                            <jsp:include flush="true" page="/commun/formatNombreStructure.jsp"/>
                        </h:inputText>
                    </h:column>

                    <h:column><h:outputText value="Qte:"/></h:column>
                    <h:column>
                        <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationPrest.hosprtQte}" style="width:80px;text-align:right;" onkeypress="return scanToucheChiffre(event)">
                            <a4j:support eventsQueue="maQueue" event="onchange" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.verifValidePrestation}" reRender="valPrest"/>
                        </h:inputText>
                    </h:column>
                </h:panelGrid>
                <br>
                <h:panelGroup id="valPrest">
                    <center>
                        <a4j:commandButton image="/images/annuler_big.png" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.fermerPrestation}" reRender="panelPrest,btnPrest"/>&nbsp;&nbsp;&nbsp;
                        <a4j:commandButton image="/images/valider_big.png" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.savePrestation}" reRender="panelPrest,tablePrest,btnPrest,idTotalListe1,idTotalListe2,idTotalListe3,idTotalListe4,idTotalListe5,gridTotal" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.validePrest}"/>
                    </center>
                </h:panelGroup>
            </a4j:form>
        </c:if>
    </rich:modalPanel>


    <rich:modalPanel id="panelListeProduits" headerClass="headerPanel" style="border:solid 1px black;background-color:white;border-radius:10px;box-shadow: 10px 10px 2px 1px rgba(0,0,0,0.5);" width="850" height="450" showWhenRendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.showModalPanelProduits}">
        <c:if test="${bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.showModalPanelProduits}" var="prd">
            <f:facet name="header"><h:outputText value="Sélection du produit"/></f:facet>
            <a4j:form id="formModalListeProduits">
                <rich:hotKey key="return" handler="return false;"/>
                <a4j:region renderRegionOnly="false">
                    <rich:datascroller renderIfSinglePage="false" pageIndexVar="pageIndex" pagesVar="pages" id="scrollTable2" maxPages="20"align="left" for="tableProd"/>
                    <rich:extendedDataTable rows="200" id="tableProd" footerClass="bard" headerClass="headerTab" activeClass="active-row" noDataLabel=" " border="0" width="100%" height="330px" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.datamodelProduits}"  var="prd">
                        <a4j:support eventsQueue="maQueue" event="onRowClick" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.selectionProduit}" reRender="valprd1,valprd2,valprd3"/>
                        <rich:column label="Famille" sortable="true" sortBy="#{prd.proVteLib}" width="20%">
                            <f:facet name="header"><h:outputText  value="Famille" /></f:facet>
                            <h:outputText value="#{prd.proVteLib}"/>
                        </rich:column>
                        <rich:column label="Code" sortable="true" sortBy="#{prd.proCode}" width="10%">
                            <f:facet name="header"><h:outputText  value="Code" /></f:facet>
                            <h:outputText value="#{prd.proCode}"/>
                        </rich:column>
                        <rich:column label="Libellé produit" sortable="true" sortBy="#{prd.proLibClient}" width="70%">
                            <f:facet name="header"><h:outputText  value="Libellé produit" /></f:facet>
                            <h:inputTextarea value="#{prd.proLibClient}" readonly="true" rows="2" style="width:100%"/>
                        </rich:column>
                    </rich:extendedDataTable>
                </a4j:region>
                <br>
                <h:panelGroup id="valprd1" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.choixPanenProd==2}">
                    <center>
                        <a4j:commandButton image="/images/annuler_big.png" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.annulerMedicamment}" reRender="panelListeProduits,ligne1"/>&nbsp;&nbsp;&nbsp;
                        <a4j:commandButton image="/images/valider_big.png" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.validerMedicamment}" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.produits.proId!=0}" reRender="panelListeProduits,ligne1"/>
                    </center>
                </h:panelGroup>
                <h:panelGroup id="valprd2" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.choixPanenProd==3}">
                    <center>
                        <a4j:commandButton image="/images/annuler_big.png" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.annulerLaboratoire}" reRender="panelListeProduits,ligne2,idNomLabo,valLabo,idPanLabo"/>&nbsp;&nbsp;&nbsp;
                        <a4j:commandButton image="/images/valider_big.png" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.validerLaboratoire}" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.produits.proId!=0}" reRender="panelListeProduits,ligne2,idNomLabo,valLabo,idPanLabo"/>
                    </center>
                </h:panelGroup>
                <h:panelGroup id="valprd3" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.choixPanenProd==4}">
                    <center>
                        <a4j:commandButton image="/images/annuler_big.png" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.annulerPrestation}" reRender="panelListeProduits,ligne3"/>&nbsp;&nbsp;&nbsp;
                        <a4j:commandButton image="/images/valider_big.png" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.validerPrestation}" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.produits.proId!=0}" reRender="panelListeProduits,ligne3"/>
                    </center>
                </h:panelGroup>
            </a4j:form>
        </c:if>
    </rich:modalPanel>


    <rich:modalPanel domElementAttachment="parent"  id="panelCaution" headerClass="headerPanel" style="border:solid 1px black;background-color:white;border-radius:10px;box-shadow: 10px 10px 2px 1px rgba(0,0,0,0.5);" width="700" height="200" showWhenRendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.showModalPanelCaution}">
        <c:if test="${bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.showModalPanelCaution}" var="caut">
            <f:facet name="header"><h:outputText value="Gestion des cautions"/></f:facet>
            <a4j:form id="formModalCaution">
                <rich:hotKey key="return" handler="return false;"/>
                <h:panelGrid width="100%" id="idPanCaution">
                    <h:panelGrid width="100%" columns="2" columnClasses="clos25,clos75" styleClass="fichefournisseur">
                        <h:column><h:outputText value="Séjour:"/></h:column>
                        <h:column>
                            <h:selectOneMenu style="width:100%" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationCaution.hoscauIdSejour}">
                                <f:selectItem itemLabel="Sélection Séjour" itemValue="0"/>
                                <f:selectItems value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.mesSejoursItems}"/>
                            </h:selectOneMenu>
                        </h:column>
                    </h:panelGrid>
                    <br>
                    <h:panelGrid columns="4" width="70%" columnClasses="clos25,clos25,clos25,clos25" styleClass="fichefournisseur">
                        <h:panelGroup>
                            <h:column><h:outputText value="Date dépot:"/></h:column>
                            <h:column><rich:calendar value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationCaution.hoscauDate}" inputSize="8"  enableManualInput="true" datePattern="dd/MM/yyyy"  locale="fr" style=" background-color:white;" readonly="#{bakingbeanepegase.menuModuleHorizontalCtrl.usersLog.usrDateMed==0}"/></h:column>
                            <h:column><h:outputText value="Montant Caution:"/></h:column>
                            <h:column>
                                <h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationCaution.hoscauMontant}" style="width:100px;text-align:right;" onkeypress="return scanToucheChiffre(event)">
                                    <jsp:include flush="true" page="/commun/formatNombreStructure.jsp"/>
                                </h:inputText>
                            </h:column>
                        </h:panelGroup>
                    </h:panelGrid>
                    <br>
                    <h:panelGroup id="valCaution">
                        <center>
                            <a4j:commandButton image="/images/annuler_big.png" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.fermerCaution}" reRender="panelCaution,btnCaution"/>&nbsp;&nbsp;&nbsp;
                            <a4j:commandButton image="/images/valider_big.png" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.saveCaution}" reRender="panelCaution,tableCaution,btnCaution"/>
                        </center>
                    </h:panelGroup>
                </h:panelGrid>
            </a4j:form>
        </c:if>
    </rich:modalPanel>


    <rich:modalPanel domElementAttachment="parent"  id="panalVisuPj" width="1100" height="600" headerClass="headerPanel" style="border:solid 1px black;background-color:white;border-radius:10px;box-shadow: 10px 10px 2px 1px rgba(0,0,0,0.5);" showWhenRendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.showModalPanelPj}">
        <c:if test="${bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.showModalPanelPj}" var="ajtFil" >
            <f:facet name="header"><h:outputText value="Visualisation du fichier PDF"></h:outputText></f:facet>
            <f:facet name="controls">
                <a4j:form >
                    <a4j:commandButton onclick="if (!confirm('Etes-vous sur de vouloir supprimer ce document ?')) return false;javascript:Richfaces.showModalPanel('modAttente');" oncomplete="javascript:Richfaces.hideModalPanel('modAttente');" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.supprimerDocumentScan}" image="/images/supprimer.png" styleClass="hidelink" reRender="modAttente,panalVisuPj,listeDoc" rendered="#{!bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.var_aff_action&&bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationEntete.hosEtat==0}"/>&nbsp;&nbsp;
                    <h:column>
                        <a type="${bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.fichierMine}" href="${bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.fichierUrl}" target="_blank" title="Lire document"><img src="images/detail.png" alt="lecture"></a>
                    </h:column>&nbsp;&nbsp;
                    <a4j:commandButton action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.fermerVisuDocumentScan}" image="/images/close.gif" styleClass="hidelink" reRender="panalVisuPj"/>
                </a4j:form>
            </f:facet>
            <a4j:form enctype="multipart/form-data">
                <rich:hotKey key="return" handler="return false;"/>
                <h:panelGrid width="100%">
                    <object data="${bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.fichierUrl}" type="${bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.fichierMine}" width="100%" height="550">
                        <a href="${bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.fichierUrl}"></a>
                    </object>
                </h:panelGrid>
            </a4j:form>
        </c:if>
    </rich:modalPanel>


    <rich:modalPanel domElementAttachment="parent"  id="panalAjoutFile" width="500" height="250" headerClass="headerPanel" style="border:solid 1px black;background-color:white;border-radius:10px;box-shadow: 10px 10px 2px 1px rgba(0,0,0,0.5);" showWhenRendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.showModalPanelAjoutFile}">
        <c:if test="${bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.showModalPanelAjoutFile}" var="ajtFil" >
            <f:facet name="header"><h:outputText value="UPLOADER DES DOCUMENTS DANS LE DOSSIER MEDICAL"></h:outputText></f:facet>
            <f:facet name="controls">
                <a4j:form >
                    <a4j:commandButton action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.annulerDocumentScan}" image="/images/close.gif" styleClass="hidelink" reRender="panalAjoutFile"/>
                </a4j:form>
            </f:facet>
            <a4j:form enctype="multipart/form-data">
                <rich:hotKey key="return" handler="return false;"/>
                <h:panelGrid width="100%" headerClass="headerTab" styleClass="panneau_accueil">
                    <h:panelGrid style="width:100%;">
                        <h:outputLabel value="Nom du document" />
                        <h:column><h:inputText style="width:100%;" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.nomDocument}" maxlength="20"/></h:column>
                        <h:outputLabel for="idDoc" value="Ajoutez un document" />
                        <t:inputFileUpload id="idDoc" accept="application/pdf" storage="file" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.uploadedPDFFile}"/>
                        <br>
                        <h:panelGroup>
                            <center>
                                <h:commandButton styleClass="exp_lienmenu" value="Sauvegarder" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.validerDocumentScan}"/>
                            </center>
                        </h:panelGroup>
                        <br>
                    </h:panelGrid>
                </h:panelGrid>
            </a4j:form>
        </c:if>
    </rich:modalPanel>


    <rich:modalPanel domElementAttachment="parent"  id="panelPec" headerClass="headerPanel" width="950" height="400" style="border:solid 1px black;background-color:white;border-radius:10px;box-shadow: 10px 10px 2px 1px rgba(0,0,0,0.5);" showWhenRendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.showModalpanelPec}">
        <c:if test="${bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.showModalpanelPec}" var="ppec">
            <f:facet name="header"><h:outputText value="DETAIL DE LA PRISE EN CHARGE"></h:outputText></f:facet>
            <f:facet name="controls">
                <a4j:form >
                    <a4j:commandButton image="/images/close.gif" id="hidelinkPec" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.fermerConsulterTarif}" reRender="panelPec"/>
                </a4j:form>
            </f:facet>
            <a4j:form>
                <rich:hotKey key="return" handler="return false;"/>
                <h:panelGrid  columns="1" style="width:100%;" id="idPanelGlobal">
                    <h:panelGrid columns="4" columnClasses="clos15,clos35,clos15,clos35" width="100%" styleClass="fichefournisseur" id="idPanelPec">
                        <h:column><h:outputText value="Choix Tiers" style="text-decoration:underline;"/></h:column>
                        <h:column>
                            <h:selectOneMenu style="width:100%;" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.patientPec.patpecType}" disabled="true">
                                <f:selectItem itemLabel="Assurance" itemValue="Assurance"/>
                                <f:selectItem itemLabel="IPM" itemValue="IPM"/>
                                <f:selectItem itemLabel="Mutuelle/Assurance" itemValue="Mutuelle/Assurance"/>
                                <f:selectItem itemLabel="Mutuelle" itemValue="Mutuelle"/>
                                <f:selectItem itemLabel="Complémentaire" itemValue="Complémentaire"/>
                                <f:selectItem itemLabel="Programme Médical" itemValue="Programme Médical"/>
                                <f:selectItem itemLabel="Client Société" itemValue="Client Société"/>
                                <f:selectItem itemLabel="Ministère" itemValue="Ministère"/>
                                <f:selectItem itemLabel="Direction" itemValue="Direction"/>
                                <f:selectItem itemLabel="Mairie" itemValue="Mairie"/>
                                <f:selectItem itemLabel="Hôpital" itemValue="Hôpital"/>
                            </h:selectOneMenu>
                        </h:column>
                        <h:column><h:outputText value="Tiers payeur" style="text-decoration:underline;"/></h:column>
                        <h:column><h:inputText style="width:95%;" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.patientPec.tiers.tieraisonsocialenom}" disabled="true"/></h:column>
                        <h:column><h:outputText value=""/></h:column>
                        <h:column><h:outputText value=""/></h:column>
                        <h:column><h:outputText value="Employeur:" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.patientPec.patpecType=='Assurance'||bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.patientPec.patpecType=='IPM'}"/></h:column>
                        <h:column><h:inputText id="idAdherent" style="width:95%;" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.patientPec.patpecNomEmployeur}" rendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.patientPec.patpecType=='Assurance'||bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.patientPec.patpecType=='IPM'}" disabled="true"/></h:column>
                        <h:column rendered="false"><h:outputText value="Agent à refacturer:"/></h:column>
                        <h:column rendered="false"><h:inputText style="width:100%;" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.patientPec.patpecAgentRefact}"/></h:column>
                        <h:column><h:outputText value="N° contrat:"/></h:column>
                        <h:column><h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.patientPec.patpecNumContrat}" disabled="true"/></h:column>
                        <h:column><h:outputText value="N° Immat. Assuré"/></h:column>
                        <h:column><h:inputText value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.patientPec.patpecMatricule}" disabled="true"/></h:column>
                        <h:column><h:outputText value="Date début"/></h:column>
                        <h:column><rich:calendar value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.patientPec.patpecDateDebut}" popup="true"  inputSize="8" enableManualInput="true" datePattern="dd/MM/yyyy"  locale="fr" style="background-color:white;" disabled="true"/></h:column>
                        <h:column><h:outputText value="Date fin"/></h:column>
                        <h:column><rich:calendar value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.patientPec.patpecDateFin}" popup="true"  inputSize="8" enableManualInput="true" datePattern="dd/MM/yyyy"  locale="fr" style="background-color:white;" disabled="true"/></h:column>
                    </h:panelGrid>
                    <h:panelGrid width="100%" styleClass="fichefournisseur1" columns="3" columnClasses="clos40c,clos30,clos30" border="0">
                        <h:column><h:outputText value="L I B E L L E " style="text-align:center"/></h:column>
                        <h:column><h:outputText value="E X T E R N E " style="text-align:center"/></h:column>
                        <h:column><h:outputText value="H O S P I T A L I S A T I O N " style="text-align:center"/></h:column>
                        <h:column><h:outputText value="1 - Frais d'hospitalisation hébergement:"/></h:column>
                        <h:column><h:outputText value=""/></h:column>
                        <h:column>
                            <h:inputText size="8" style="text-align:right;" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.patientPec.patpecHebergementPlaf}" disabled="true">
                                <jsp:include flush="true" page="/commun/formatNombreStructure.jsp"/>
                            </h:inputText>&nbsp;&nbsp;
                            <h:outputText value="(plafond #{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.structureLog.strdevise})"/>
                            <br>
                            <h:inputText size="5" style="text-align:right;" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.patientPec.patpecHebergementRep}" disabled="true"/>%
                        </h:column>
                        <h:column><h:outputText value="2- Actes et examens (%):"/></h:column>
                        <h:column><h:inputText size="5" style="text-align:right;" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.patientPec.patpecSoins}" disabled="true"/>%</h:column>
                        <h:column><h:inputText size="5" style="text-align:right;" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.patientPec.patpecSoinsHospit}" disabled="true"/>%</h:column>
                        <h:column><h:outputText value="3 - Fourniture pharmacie (%):"/></h:column>
                        <h:column><h:inputText size="5" style="text-align:right;" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.patientPec.patpecMedicament}" disabled="true"/>%</h:column>
                        <h:column><h:inputText size="5" style="text-align:right;" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.patientPec.patpecMedicamentHospit}" disabled="true"/>%</h:column>
                        <h:column><h:outputText value="4 - Laboratoire et examens complémentaires (%):"/></h:column>
                        <h:column><h:inputText size="5" style="text-align:right;" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.patientPec.patpecExamenss}" disabled="true"/>%</h:column>
                        <h:column><h:inputText size="5" style="text-align:right;" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.patientPec.patpecExamenssHospit}" disabled="true"/>%</h:column>
                        <h:column><h:outputText value="5 - Autres préstations de soins fournies (%):"/></h:column>
                        <h:column><h:outputText value=""/></h:column>
                        <h:column><h:inputText size="5" style="text-align:right;" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.patientPec.patpecPrestations}" disabled="true"/>%</h:column>
                        <h:column><h:outputText value="6 - Autres préstations d'hotelière fournies (%):"/></h:column>
                        <h:column><h:outputText value=""/></h:column>
                        <h:column><h:inputText size="5" style="text-align:right;" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.patientPec.patpacHotelerie}" disabled="true"/>%</h:column>
                        <h:column><h:outputText value="Forfait global:"/></h:column>
                        <h:column><h:outputText value=""/></h:column>
                        <h:column>
                            <h:inputText size="8" style="text-align:right;" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.patientPec.patpecForfait}" disabled="true">
                                <jsp:include flush="true" page="/commun/formatNombreStructure.jsp"/>
                            </h:inputText>&nbsp;&nbsp;
                            <h:outputText value="(#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.structureLog.strdevise})"/>
                        </h:column>
                    </h:panelGrid>
                </h:panelGrid>
            </a4j:form>
        </c:if>
    </rich:modalPanel>


    <rich:modalPanel domElementAttachment="parent"  id="panelChangerService" width="400" height="250" headerClass="headerPanel" style="border:solid 1px black;background-color:white;border-radius:10px;box-shadow: 10px 10px 2px 1px rgba(0,0,0,0.5);" showWhenRendered="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.showModalPanelChangerService}">
        <c:if test="${bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.showModalPanelChangerService}" var="chs">
            <f:facet name="header"><h:outputText value="Change Service"></h:outputText></f:facet>
            <f:facet name="controls">
                <a4j:form >
                    <a4j:commandButton action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.annulerChangerService}" image="/images/close.gif" styleClass="hidelink" id="hidelinkChg" reRender="panelChangerService"/>
                    <rich:componentControl for="panelChg" attachTo="hidelinkChg" operation="hide" event="onclick"/>
                </a4j:form>
            </f:facet>
            <a4j:form >
                <rich:hotKey key="return" handler="return false;"/>
                <h:panelGrid  style="width:100%;">
                    <h:panelGrid  columns="2" columnClasses="clos30,clos70" style="width:100%;" styleClass="recherche">
                        <h:column><h:outputText value="Ancien service:"/></h:column>
                        <h:column><h:inputText style="width:100%" readonly="true" disabled="true" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.hospitalisationSejour.hossejService}"/></h:column>
                        <h:column><h:outputText value="Nouveau service:" style="text-decoration:underline;"/></h:column>
                        <h:column>
                            <h:selectOneMenu style="width:100%" value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.nouveauService}" >
                                <f:selectItem itemLabel="Sélectionner un service" itemValue=""/>
                                <f:selectItems value="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.mesServicesItems}"/>
                            </h:selectOneMenu>
                        </h:column>
                    </h:panelGrid>
                </h:panelGrid>
                <h:panelGroup>
                    <center>
                        <h:commandButton image="/images/valider_big.png" action="#{bakingbeanepegase.menuModuleHorizontalCtrl.formBakingBeanMedical.formHospitalisation.validerChangerService}"/>
                    </center>
                </h:panelGroup>
            </a4j:form>
        </c:if>
    </rich:modalPanel>



</f:subview>
