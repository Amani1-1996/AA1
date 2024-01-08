*------------------------------------------------------------*;
* EM Version: 15.2;
* SAS Release: 9.04.01M7P080620;
* Host: odaws02-apse1.oda.sas.com;
* Project Path: ~;
* Project Name: exam;
* Diagram Id: EMWS1;
* Diagram Name: exam;
* Generated by: amanialshanqiti;
* Date: 08JAN2024:01:30:21;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Macro Variables;
*------------------------------------------------------------*;
%let EM_PROJECT =;
%let EM_PROJECTNAME =;
%let EM_WSNAME =;
%let EM_WSDESCRIPTION =exam;
%let EM_SUMMARY =WORK.SUMMARY;
%let EM_NUMTASKS =SINGLE;
%let EM_EDITMODE =R;
%let EM_DEBUGVAL =;
%let EM_ACTION =run;
*------------------------------------------------------------*;
%macro em_usedatatable;
%if ^%symexist(EM_USEDATATABLE) %then %do;
%let EM_USEDATATABLE = Y;
%end;
%if "&EM_USEDATATABLE" ne "N" %then %do;
*------------------------------------------------------------*;
* Data Tables;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
%end;
%mend em_usedatatable;
%em_usedatatable;
*------------------------------------------------------------*;
* Create workspace data set;
*------------------------------------------------------------*;
data workspace;
length property $64 value $200;
property= 'PROJECTLOCATION';
value= "&EM_PROJECT";
output;
property= 'PROJECTNAME';
value= "&EM_PROJECTNAME";
output;
property= 'WORKSPACENAME';
value= "&EM_WSNAME";
output;
property= 'WORKSPACEDESCRIPTION';
value= "&EM_WSDESCRIPTION";
output;
property= 'SUMMARYDATASET';
value= "&EM_SUMMARY";
output;
property= 'NUMTASKS';
value= "&EM_NUMTASKS";
output;
property= 'EDITMODE';
value= "&EM_EDITMODE";
output;
property= 'DEBUG';
value= "&EM_DEBUGVAL";
output;
run;
*------------------------------------------------------------*;
* Create nodes data set;
*------------------------------------------------------------*;
data nodes;
length id $12 component $32 description $64 X 8 Y 8 diagramID $32 parentID $32;
id= "Smpl";
component="Sample";
description= "Sample";
diagramID="_ROOT_";
parentID="";
X=492;
Y=138;
output;
id= "Meta";
component="Metadata";
description= "Metadata";
diagramID="_ROOT_";
parentID="";
X=320;
Y=125;
output;
id= "Impt";
component="Impute";
description= "Impute";
diagramID="_ROOT_";
parentID="";
X=636;
Y=187;
output;
id= "FIMPORT";
component="FileImport";
description= "File Import";
diagramID="_ROOT_";
parentID="";
X=136;
Y=87;
output;
id= "EMSave";
component="EMSave";
description= "Save Data";
diagramID="_ROOT_";
parentID="";
X=778;
Y=264;
output;
run;
*------------------------------------------------------------*;
* EMNOTES File for Smpl;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"Smpl_EMNOTES.txt";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath" encoding="utf-8" NOBOM;
file dspath;
run;
*------------------------------------------------------------*;
* Variable Attributes for Meta;
*------------------------------------------------------------*;
data WORK.Meta_VariableAttribute;
length Variable $64 AttributeName $32 AttributeValue $64;
Variable='Age';
AttributeName="HIDDEN";
AttributeValue='N';
Output;
Variable='Churn';
AttributeName="NEWROLE";
AttributeValue='TARGET';
Output;
Variable='Churn';
AttributeName="NEWLEVEL";
AttributeValue='BINARY';
Output;
Variable='Churn';
AttributeName="HIDDEN";
AttributeValue='N';
Output;
Variable='CustomerID';
AttributeName="NEWROLE";
AttributeValue='INPUT';
Output;
Variable='CustomerID';
AttributeName="HIDDEN";
AttributeValue='N';
Output;
Variable='DeviceUsedForShopping';
AttributeName="HIDDEN";
AttributeValue='N';
Output;
Variable='FavoriteCategory';
AttributeName="HIDDEN";
AttributeValue='N';
Output;
Variable='Gender';
AttributeName="HIDDEN";
AttributeValue='N';
Output;
Variable='LastPurchaseDate';
AttributeName="NEWROLE";
AttributeValue='REJECTED';
Output;
Variable='LastPurchaseDate';
AttributeName="NEWLEVEL";
AttributeValue='NOMINAL';
Output;
Variable='LastPurchaseDate';
AttributeName="HIDDEN";
AttributeValue='N';
Output;
Variable='Location';
AttributeName="HIDDEN";
AttributeValue='N';
Output;
Variable='MembershipLevel';
AttributeName="HIDDEN";
AttributeValue='N';
Output;
Variable='PaymentMethod';
AttributeName="HIDDEN";
AttributeValue='N';
Output;
Variable='TotalPurchases';
AttributeName="HIDDEN";
AttributeValue='N';
Output;
Variable='TotalSpent';
AttributeName="HIDDEN";
AttributeValue='N';
Output;
Variable='TotalVisits';
AttributeName="HIDDEN";
AttributeValue='N';
Output;
run;
*------------------------------------------------------------*;
* IMPORTSET Data Set for Meta;
*------------------------------------------------------------*;
data WORK.Meta_ImportSet;
  length   USE                              $ 1
           PORT                             $ 32
           NODELABEL                        $ 32
           NODEPORT                         $ 32
           LIBNAME                          $ 8
           DATASET                          $ 32
           ROLE                             $ 20
           MODTIME                            8
           COLUMNMETA                       $ 32
           COLUMNMETAMODTIME                  8
           EMINFO                           $ 32
           EMINFOMODTIME                      8
           NOBS                               8
           DATASOURCE                       $ 29
           ;

  format   MODTIME DATETIME20.
           COLUMNMETAMODTIME DATETIME20.
           EMINFOMODTIME DATETIME20.
           ;
USE="Y";
PORT="DATA";
NODELABEL="FIMPORT";
NODEPORT="TRAIN";
LIBNAME="";
DATASET="FIMPORT_train";
ROLE="TRAIN";
MODTIME=2020188420.29288;
COLUMNMETA="FIMPORT_CMeta_TRAIN";
COLUMNMETAMODTIME=2020188420.56654;
EMINFO="";
EMINFOMODTIME=.;
NOBS=-1;
DATASOURCE="";
output;
USE="Y";
PORT="VALIDATE";
NODELABEL="";
NODEPORT="";
LIBNAME="";
DATASET="";
ROLE="";
MODTIME=.;
COLUMNMETA="";
COLUMNMETAMODTIME=.;
EMINFO="";
EMINFOMODTIME=.;
NOBS=.;
DATASOURCE="";
output;
USE="Y";
PORT="TEST";
NODELABEL="";
NODEPORT="";
LIBNAME="";
DATASET="";
ROLE="";
MODTIME=.;
COLUMNMETA="";
COLUMNMETAMODTIME=.;
EMINFO="";
EMINFOMODTIME=.;
NOBS=.;
DATASOURCE="";
output;
USE="Y";
PORT="SCORE";
NODELABEL="";
NODEPORT="";
LIBNAME="";
DATASET="";
ROLE="";
MODTIME=.;
COLUMNMETA="";
COLUMNMETAMODTIME=.;
EMINFO="";
EMINFOMODTIME=.;
NOBS=.;
DATASOURCE="";
output;
USE="Y";
PORT="TRANSACTION";
NODELABEL="";
NODEPORT="";
LIBNAME="";
DATASET="";
ROLE="";
MODTIME=.;
COLUMNMETA="";
COLUMNMETAMODTIME=.;
EMINFO="";
EMINFOMODTIME=.;
NOBS=.;
DATASOURCE="";
output;
USE="Y";
PORT="DOCUMENT";
NODELABEL="";
NODEPORT="";
LIBNAME="";
DATASET="";
ROLE="";
MODTIME=.;
COLUMNMETA="";
COLUMNMETAMODTIME=.;
EMINFO="";
EMINFOMODTIME=.;
NOBS=.;
DATASOURCE="";
output;
USE="Y";
PORT="CLUSMEAN";
NODELABEL="";
NODEPORT="";
LIBNAME="";
DATASET="";
ROLE="";
MODTIME=.;
COLUMNMETA="";
COLUMNMETAMODTIME=.;
EMINFO="";
EMINFOMODTIME=.;
NOBS=.;
DATASOURCE="";
output;
USE="Y";
PORT="CLUSSTAT";
NODELABEL="";
NODEPORT="";
LIBNAME="";
DATASET="";
ROLE="";
MODTIME=.;
COLUMNMETA="";
COLUMNMETAMODTIME=.;
EMINFO="";
EMINFOMODTIME=.;
NOBS=.;
DATASOURCE="";
output;
USE="Y";
PORT="ESTIMATE";
NODELABEL="";
NODEPORT="";
LIBNAME="";
DATASET="";
ROLE="";
MODTIME=.;
COLUMNMETA="";
COLUMNMETAMODTIME=.;
EMINFO="";
EMINFOMODTIME=.;
NOBS=.;
DATASOURCE="";
output;
USE="Y";
PORT="RANK";
NODELABEL="";
NODEPORT="";
LIBNAME="";
DATASET="";
ROLE="";
MODTIME=.;
COLUMNMETA="";
COLUMNMETAMODTIME=.;
EMINFO="";
EMINFOMODTIME=.;
NOBS=.;
DATASOURCE="";
output;
USE="Y";
PORT="REPORTFIT";
NODELABEL="";
NODEPORT="";
LIBNAME="";
DATASET="";
ROLE="";
MODTIME=.;
COLUMNMETA="";
COLUMNMETAMODTIME=.;
EMINFO="";
EMINFOMODTIME=.;
NOBS=.;
DATASOURCE="";
output;
USE="Y";
PORT="RULES";
NODELABEL="";
NODEPORT="";
LIBNAME="";
DATASET="";
ROLE="";
MODTIME=.;
COLUMNMETA="";
COLUMNMETAMODTIME=.;
EMINFO="";
EMINFOMODTIME=.;
NOBS=.;
DATASOURCE="";
output;
USE="Y";
PORT="SCOREDIST";
NODELABEL="";
NODEPORT="";
LIBNAME="";
DATASET="";
ROLE="";
MODTIME=.;
COLUMNMETA="";
COLUMNMETAMODTIME=.;
EMINFO="";
EMINFOMODTIME=.;
NOBS=.;
DATASOURCE="";
output;
USE="Y";
PORT="TERMS";
NODELABEL="";
NODEPORT="";
LIBNAME="";
DATASET="";
ROLE="";
MODTIME=.;
COLUMNMETA="";
COLUMNMETAMODTIME=.;
EMINFO="";
EMINFOMODTIME=.;
NOBS=.;
DATASOURCE="";
output;
USE="Y";
PORT="TREE";
NODELABEL="";
NODEPORT="";
LIBNAME="";
DATASET="";
ROLE="";
MODTIME=.;
COLUMNMETA="";
COLUMNMETAMODTIME=.;
EMINFO="";
EMINFOMODTIME=.;
NOBS=.;
DATASOURCE="";
output;
USE="Y";
PORT="VARMAP";
NODELABEL="";
NODEPORT="";
LIBNAME="";
DATASET="";
ROLE="";
MODTIME=.;
COLUMNMETA="";
COLUMNMETAMODTIME=.;
EMINFO="";
EMINFOMODTIME=.;
NOBS=.;
DATASOURCE="";
output;
;
run;
*------------------------------------------------------------*;
* VARIABLEPROPERTIES_DATA File for Meta;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"Meta_VARIABLEPROPERTIES_DATA.sas";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath";
file dspath;
put '*------------------------------------------------------------*;';
put '* Variable Attributes for DATA;';
put '*------------------------------------------------------------*;';
put 'if upcase(NAME) = "CHURN" then NEWROLE="TARGET";';
put 'if upcase(NAME) = "CHURN" then NEWLEVEL="BINARY";';
put 'if upcase(NAME) = "CUSTOMERID" then NEWROLE="INPUT";';
put 'if upcase(NAME) = "LASTPURCHASEDATE" then NEWROLE="REJECTED";';
put 'if upcase(NAME) = "LASTPURCHASEDATE" then NEWLEVEL="NOMINAL";';
run;
*------------------------------------------------------------*;
* METACODE_DATA File for Meta;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"Meta_METACODE_DATA.sas";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath";
file dspath;
put '*------------------------------------------------------------*;';
put '* Metadata Changes;';
put '*------------------------------------------------------------*;';
put 'if upcase(NAME) = "CHURN" then ROLE="TARGET";';
put 'if upcase(NAME) = "CHURN" then LEVEL="BINARY";';
put 'if upcase(NAME) = "CUSTOMERID" then ROLE="INPUT";';
put 'if upcase(NAME) = "LASTPURCHASEDATE" then ROLE="REJECTED";';
put 'if upcase(NAME) = "LASTPURCHASEDATE" then LEVEL="NOMINAL";';
run;
*------------------------------------------------------------*;
* EMNOTES File for Meta;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"Meta_EMNOTES.txt";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath" encoding="utf-8" NOBOM;
file dspath;
run;
*------------------------------------------------------------*;
* EMNOTES File for Impt;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"Impt_EMNOTES.txt";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath" encoding="utf-8" NOBOM;
file dspath;
run;
*------------------------------------------------------------*;
* USERTRAINCODE File for FIMPORT;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"FIMPORT_USERTRAINCODE.sas";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath";
file dspath;
run;
*------------------------------------------------------------*;
* VARIABLESETDELTA File for FIMPORT;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"FIMPORT_VARIABLESETDELTA.txt";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath";
file dspath;
run;
*------------------------------------------------------------*;
* DELTACODE File for FIMPORT;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"FIMPORT_DELTACODE.txt";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath";
file dspath;
run;
*------------------------------------------------------------*;
* EMNOTES File for FIMPORT;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"FIMPORT_EMNOTES.txt";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath" encoding="utf-8" NOBOM;
file dspath;
run;
*------------------------------------------------------------*;
* Variable Attributes for EMSave;
*------------------------------------------------------------*;
data WORK.EMSave_VariableAttribute;
length Variable $64 AttributeName $32 AttributeValue $64;
Variable='CustomerID';
AttributeName="ROLE";
AttributeValue='ID';
Output;
run;
*------------------------------------------------------------*;
* USERTRAINCODE File for EMSave;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"EMSave_USERTRAINCODE.sas";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath";
file dspath;
run;
*------------------------------------------------------------*;
* EMNOTES File for EMSave;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"EMSave_EMNOTES.txt";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath" encoding="utf-8" NOBOM;
file dspath;
run;
*------------------------------------------------------------*;
* Create node properties data set;
*------------------------------------------------------------*;
data nodeprops;
length id $12 property $64 value $400;
id= "Smpl";
property="Method";
value= "DEFAULT";
output;
id= "Smpl";
property="SizeType";
value= "PERCENT";
output;
id= "Smpl";
property="SizePercent";
value= "10";
output;
id= "Smpl";
property="SizeObs";
value= ".";
output;
id= "Smpl";
property="RandomSeed";
value= "12345";
output;
id= "Smpl";
property="Alpha";
value= "0.01";
output;
id= "Smpl";
property="Pvalue";
value= "0.01";
output;
id= "Smpl";
property="AdjustFreq";
value= "N";
output;
id= "Smpl";
property="FreqMiss";
value= "N";
output;
id= "Smpl";
property="FreqCount";
value= "N";
output;
id= "Smpl";
property="StratifyCriterion";
value= "PROPORTIONAL";
output;
id= "Smpl";
property="MinStrataSize";
value= "5";
output;
id= "Smpl";
property="IgnoreSmallStrata";
value= "N";
output;
id= "Smpl";
property="ClusterMethod";
value= "RANDOM";
output;
id= "Smpl";
property="LevelProportion";
value= "100";
output;
id= "Smpl";
property="LevelSampleProportion";
value= "50";
output;
id= "Smpl";
property="LevelSelection";
value= "EVENT";
output;
id= "Smpl";
property="OutputType";
value= "DATA";
output;
id= "Smpl";
property="IntervalDistribution";
value= "Y";
output;
id= "Smpl";
property="ClassDistribution";
value= "Y";
output;
id= "Smpl";
property="ForceRun";
value= "N";
output;
id= "Smpl";
property="RunAction";
value= "Train";
output;
id= "Smpl";
property="Component";
value= "Sample";
output;
id= "Smpl";
property="EM_FILE_EMNOTES";
value= "Smpl_EMNOTES.txt";
output;
id= "Meta";
property="HideRejected";
value= "N";
output;
id= "Meta";
property="AdvancedAdvisor";
value= "N";
output;
id= "Meta";
property="CombineRule";
value= "NONE";
output;
id= "Meta";
property="ComputeStatistics";
value= "N";
output;
id= "Meta";
property="ForceRun";
value= "N";
output;
id= "Meta";
property="RunAction";
value= "Train";
output;
id= "Meta";
property="Component";
value= "Metadata";
output;
id= "Meta";
property="EM_VARIABLEATTRIBUTES";
value= "WORK.Meta_VariableAttribute";
output;
id= "Meta";
property="EM_DATA_IMPORTSET";
value= "WORK.Meta_ImportSet";
output;
id= "Meta";
property="EM_FILE_VARIABLEPROPERTIES_DATA";
value= "Meta_VARIABLEPROPERTIES_DATA.sas";
output;
id= "Meta";
property="EM_FILE_METACODE_DATA";
value= "Meta_METACODE_DATA.sas";
output;
id= "Meta";
property="EM_FILE_EMNOTES";
value= "Meta_EMNOTES.txt";
output;
id= "Impt";
property="MethodInterval";
value= "MEAN";
output;
id= "Impt";
property="MethodClass";
value= "COUNT";
output;
id= "Impt";
property="MethodTargetInterval";
value= "NONE";
output;
id= "Impt";
property="MethodTargetClass";
value= "NONE";
output;
id= "Impt";
property="ABWTuning";
value= "9";
output;
id= "Impt";
property="AHUBERTuning";
value= "1.5";
output;
id= "Impt";
property="AWAVETuning";
value= "6.2831853072";
output;
id= "Impt";
property="SpacingProportion";
value= "90";
output;
id= "Impt";
property="DefaultChar";
value= "";
output;
id= "Impt";
property="DefaultNum";
value= ".";
output;
id= "Impt";
property="RandomSeed";
value= "12345";
output;
id= "Impt";
property="Normalize";
value= "Y";
output;
id= "Impt";
property="ImputeNoMissing";
value= "N";
output;
id= "Impt";
property="MaxPctMissing";
value= "50";
output;
id= "Impt";
property="ValidateTestMissing";
value= "N";
output;
id= "Impt";
property="DistributionMissing";
value= "N";
output;
id= "Impt";
property="LeafSize";
value= "5";
output;
id= "Impt";
property="Maxbranch";
value= "2";
output;
id= "Impt";
property="Maxdepth";
value= "6";
output;
id= "Impt";
property="MinCatSize";
value= "5";
output;
id= "Impt";
property="Nrules";
value= "5";
output;
id= "Impt";
property="Nsurrs";
value= "2";
output;
id= "Impt";
property="Splitsize";
value= ".";
output;
id= "Impt";
property="Indicator";
value= "NONE";
output;
id= "Impt";
property="IndicatorRole";
value= "REJECTED";
output;
id= "Impt";
property="ReplaceVariable";
value= "N";
output;
id= "Impt";
property="HideVariable";
value= "Y";
output;
id= "Impt";
property="IndicatorSource";
value= "IMPUTED";
output;
id= "Impt";
property="ForceRun";
value= "N";
output;
id= "Impt";
property="RunAction";
value= "Train";
output;
id= "Impt";
property="Component";
value= "Impute";
output;
id= "Impt";
property="EM_FILE_EMNOTES";
value= "Impt_EMNOTES.txt";
output;
id= "FIMPORT";
property="Location";
value= "CATALOG";
output;
id= "FIMPORT";
property="Catalog";
value= "SASHELP.EMSAMP.Fimport.SOURCE";
output;
id= "FIMPORT";
property="ImportType";
value= "Local";
output;
id= "FIMPORT";
property="GuessRows";
value= "500";
output;
id= "FIMPORT";
property="Delimiter";
value= ",";
output;
id= "FIMPORT";
property="NameRow";
value= "Y";
output;
id= "FIMPORT";
property="SkipRows";
value= "0";
output;
id= "FIMPORT";
property="MaxRows";
value= "1000000";
output;
id= "FIMPORT";
property="MaxCols";
value= "10000";
output;
id= "FIMPORT";
property="FileType";
value= "xlsx";
output;
id= "FIMPORT";
property="Role";
value= "TRAIN";
output;
id= "FIMPORT";
property="ForceRun";
value= "N";
output;
id= "FIMPORT";
property="Summarize";
value= "N";
output;
id= "FIMPORT";
property="AdvancedAdvisor";
value= "N";
output;
id= "FIMPORT";
property="RunAction";
value= "Train";
output;
id= "FIMPORT";
property="Component";
value= "FileImport";
output;
id= "FIMPORT";
property="IFileName";
value= "C:\Users\ahmed\Downloads\DataCustomer.xlsx";
output;
id= "FIMPORT";
property="AccessTable";
value= "NoTableName";
output;
id= "FIMPORT";
property="UserID";
value= "NoUserID";
output;
id= "FIMPORT";
property="Password";
value= "NoPassword";
output;
id= "FIMPORT";
property="ToolType";
value= "SAMPLE";
output;
id= "FIMPORT";
property="ToolPrefix";
value= "FIMPORT";
output;
id= "FIMPORT";
property="EM_FILE_USERTRAINCODE";
value= "FIMPORT_USERTRAINCODE.sas";
output;
id= "FIMPORT";
property="EM_FILE_VARIABLESETDELTA";
value= "FIMPORT_VARIABLESETDELTA.txt";
output;
id= "FIMPORT";
property="EM_FILE_DELTACODE";
value= "FIMPORT_DELTACODE.txt";
output;
id= "FIMPORT";
property="EM_FILE_EMNOTES";
value= "FIMPORT_EMNOTES.txt";
output;
id= "EMSave";
property="Location";
value= "CATALOG";
output;
id= "EMSave";
property="Catalog";
value= "Sashelp.Emutil.Savext.Source";
output;
id= "EMSave";
property="Type";
value= "XLSX";
output;
id= "EMSave";
property="Replace";
value= "Y";
output;
id= "EMSave";
property="AllObs";
value= "Y";
output;
id= "EMSave";
property="OutObs";
value= "1000";
output;
id= "EMSave";
property="AllRoles";
value= "Y";
output;
id= "EMSave";
property="Train";
value= "Y";
output;
id= "EMSave";
property="Validate";
value= "Y";
output;
id= "EMSave";
property="Test";
value= "Y";
output;
id= "EMSave";
property="Score";
value= "Y";
output;
id= "EMSave";
property="Transaction";
value= "Y";
output;
id= "EMSave";
property="ForceRun";
value= "N";
output;
id= "EMSave";
property="RunAction";
value= "Train";
output;
id= "EMSave";
property="Component";
value= "EMSave";
output;
id= "EMSave";
property="Lib";
value= "";
output;
id= "EMSave";
property="DirectorySelector";
value= "";
output;
id= "EMSave";
property="Name";
value= "";
output;
id= "EMSave";
property="ToolType";
value= "UTILITY";
output;
id= "EMSave";
property="ToolPrefix";
value= "EMSave";
output;
id= "EMSave";
property="EM_VARIABLEATTRIBUTES";
value= "WORK.EMSave_VariableAttribute";
output;
id= "EMSave";
property="EM_FILE_USERTRAINCODE";
value= "EMSave_USERTRAINCODE.sas";
output;
id= "EMSave";
property="EM_FILE_EMNOTES";
value= "EMSave_EMNOTES.txt";
output;
run;
*------------------------------------------------------------*;
* Create connections data set;
*------------------------------------------------------------*;
data connect;
length from to $12;
from="Impt";
to="EMSave";
output;
from="Smpl";
to="Impt";
output;
from="Meta";
to="Smpl";
output;
from="FIMPORT";
to="Meta";
output;
run;
*------------------------------------------------------------*;
* Create actions to run data set;
*------------------------------------------------------------*;
%macro emaction;
%let actionstring = %upcase(&EM_ACTION);
%if %index(&actionstring, RUN) or %index(&actionstring, REPORT) %then %do;
data actions;
length id $12 action $40;
id="EMSave";
%if %index(&actionstring, RUN) %then %do;
action='run';
output;
%end;
%if %index(&actionstring, REPORT) %then %do;
action='report';
output;
%end;
run;
%end;
%mend;
%emaction;
*------------------------------------------------------------*;
* Execute the actions;
*------------------------------------------------------------*;
%em5batch(execute, workspace=workspace, nodes=nodes, connect=connect, datasources=datasources, nodeprops=nodeprops, action=actions);
