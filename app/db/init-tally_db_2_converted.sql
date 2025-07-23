--
-- PostgreSQL database dump
--

-- Dumped from database version 15.13 (Debian 15.13-1.pgdg120+1)
-- Dumped by pg_dump version 17.5

-- Started on 2025-07-04 12:13:21

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 221 (class 1259 OID 33395)
-- Name: currency; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.currency (
    activefrom text,
    activeto text,
    guid text,
    mailingname text,
    narration text,
    remoteguid text,
    remotealtguid text,
    enteredby text,
    alteredby text,
    typeofupdateactivity text,
    objectupdateaction text,
    originalname text,
    isocurrencycode text,
    expandedsymbol text,
    decimalsymbol text,
    ismstfromsync text,
    isupdatingtargetid text,
    isdeleted text,
    issecurityonwhenentered text,
    asoriginal text,
    issuffix text,
    hasspace text,
    inmillions text,
    errkey text,
    alterid text,
    remotealterid text,
    decimalplaces text,
    decimalplacesforprinting text,
    updateddatetime text,
    dailystdrateslist text,
    dailybuyingrateslist text,
    dailysellingrateslist text
);


ALTER TABLE public.currency OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 33400)
-- Name: godown; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.godown (
    activefrom text,
    activeto text,
    exciseregistrationdate text,
    lutdateofissue text,
    lutexpirydate text,
    bonddateofissue text,
    bondexpirydate text,
    guid text,
    pincode text,
    phonenumber text,
    exciserange text,
    exciserangeaddress text,
    excisedivisionaddress text,
    excisecommissionerate text,
    exciserangecode text,
    excisedivisioncode text,
    statename text,
    parent text,
    narration text,
    remoteguid text,
    remotealtguid text,
    enteredby text,
    alteredby text,
    typeofupdateactivity text,
    objectupdateaction text,
    importerexportercode text,
    exciseregno text,
    jobname text,
    exciseregistrationtype text,
    excisemailingname text,
    excisemanufacturertype text,
    exciselargetaxpayer text,
    excisedivisionname text,
    excisecomsnratecode text,
    excisecomsnrateaddress text,
    are1serialmaster text,
    are2serialmaster text,
    are3serialmaster text,
    lutnumber text,
    bondnumber text,
    authorityname text,
    authorityaddress text,
    taxunitname text,
    typeofconsignmentagent text,
    itemstate text,
    excisearename text,
    traderrgnoprefix text,
    traderrgnosuffix text,
    ismstfromsync text,
    isupdatingtargetid text,
    isdeleted text,
    issecurityonwhenentered text,
    asoriginal text,
    hasnospace text,
    hasnostock text,
    isexternal text,
    isinternal text,
    enableexport text,
    isprimaryexciseunit text,
    allowexportrebate text,
    istraderrgnumberon text,
    errkey text,
    alterid text,
    remotealterid text,
    updateddatetime text,
    languagenamelist text,
    schvidetailslist text,
    excisetariffdetailslist text,
    serialnumberlistlist text,
    excisemfgdetailslist text,
    exciselutdetailslist text,
    excisebonddetailslist text,
    exciserangedetailslist text,
    excisedivisiondetailslist text,
    excisecommissioneratedetailslist text
);


ALTER TABLE public.godown OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 33380)
-- Name: ledgergroups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ledgergroups (
    samplingdateonefactor text,
    samplingdatetwofactor text,
    activefrom text,
    activeto text,
    guid text,
    parent text,
    samplingmethod text,
    samplingstronefactor text,
    narration text,
    enteredby text,
    alteredby text,
    typeofupdateactivity text,
    objectupdateaction text,
    requestorrule text,
    basicgroupiscalculable text,
    addlalloctype text,
    grpdebitparent text,
    grpcreditparent text,
    sysdebitparent text,
    syscreditparent text,
    balancingtype text,
    tdsapplicable text,
    tcsapplicable text,
    gstapplicable text,
    isbillwiseon text,
    iscostcentreson text,
    isaddable text,
    isupdatingtargetid text,
    isdeleted text,
    issecurityonwhenentered text,
    asoriginal text,
    issubledger text,
    isrevenue text,
    affectsgrossprofit text,
    isdeemedpositive text,
    tracknegativebalances text,
    iscondensed text,
    affectsstock text,
    isgroupforloanrcpt text,
    isgroupforloanpymnt text,
    israteinclusivevat text,
    isinvdetailsenable text,
    samplingnumonefactor text,
    samplingnumtwofactor text,
    errkey text,
    sortposition text,
    alterid text,
    samplingamtonefactor text,
    samplingamttwofactor text,
    updateddatetime text,
    tempgstcgstrate text,
    tempgstsgstrate text,
    tempgstigstrate text,
    tempgststatecessrate text,
    tempapplicablefrom text,
    tempisreversechargeappl text,
    tempgsteligibleitc text,
    tempgstinclexpforslabtax text,
    tempgstcalcslabonmrp text,
    tempgstclassification text,
    tempgsttaxablility text,
    tempgstnatureoftransaction text,
    tempsrcofgstdetails text,
    tempgsttaxrate text,
    tempgstcessrate text,
    tempgstcessqtyrate text,
    tempgstcessvaltype text,
    tempgstslabcessvaltype text,
    tempgstslabcessrate text,
    tempgstslabcessqtyrate text,
    tempgstslabstatecessrate text,
    tempgsthsnapplfrom text,
    tempsrcofhsndetails text,
    tempgsthsnclassification text,
    tempgsthsncode text,
    tempgsthsndescription text,
    tempgsttaxablilitygstclassif text,
    tempgstnatureoftransactiongstclassif text,
    tempgstigstrategstclassif text,
    tempgstcgstrategstclassif text,
    tempgstsgstrategstclassif text,
    tempgstcessvaltypegstclassif text,
    tempgstcessqtyrategstclassif text,
    tempgststatecessrategstclassif text,
    tempisreversechargeapplgstclassif text,
    tempgsteligibleitcgstclassif text,
    tempgstcessrategstclassif text,
    tempgsthsncodegstclassif text,
    tempgsthsndescriptiongstclassif text,
    tempgroupnature text,
    tempaffectsgp text,
    tempisvatfieldsedited text,
    tempappldate text,
    tempclassification text,
    tempnature text,
    temppartyentity text,
    tempbusinessnature text,
    tempvatrate text,
    tempaddltax text,
    tempcessonvat text,
    temptaxtype text,
    tempmajorcommodityname text,
    tempcommodityname text,
    tempcommoditycode text,
    tempsubcommoditycode text,
    tempuom text,
    temptypeofgoods text,
    temptradename text,
    tempgoodsnature text,
    tempschedule text,
    tempscheduleslno text,
    tempisinvdetailsenable text,
    templocalvatrate text,
    tempvaluationtype text,
    tempiscalconqty text,
    servicetaxdetailslist text,
    vatdetailslist text,
    salestaxcessdetailslist text,
    gstdetailslist text,
    hsndetailslist text,
    languagenamelist text,
    xbrldetaillist text,
    auditdetailslist text,
    schvidetailslist text,
    excisetariffdetailslist text,
    tcscategorydetailslist text,
    tdscategorydetailslist text,
    gstclassfnigstrateslist text,
    extariffdutyheaddetailslist text,
    tempgstitemslabrateslist text
);


ALTER TABLE public.ledgergroups OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 33385)
-- Name: ledgers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ledgers (
    oldauditentryidslist text,
    startingfrom text,
    stregdate text,
    lbtregndate text,
    vatregistrationdate text,
    cstregistrationdate text,
    samplingdateonefactor text,
    samplingdatetwofactor text,
    activefrom text,
    activeto text,
    createddate text,
    alteredon text,
    vatapplicabledate text,
    exciseregistrationdate text,
    panapplicablefrom text,
    payinsrunningfiledate text,
    vattaxexemptiondate text,
    banklastimportstmtdate text,
    guid text,
    currencyname text,
    email text,
    priorstatename text,
    website text,
    incometaxnumber text,
    salestaxnumber text,
    interstatestnumber text,
    vattinnumber text,
    exciserange text,
    excisedivision text,
    excisecommissionerate text,
    lbtregnno text,
    lbtzone text,
    exportimportcode text,
    branchname text,
    interstateoldstnumber text,
    vatoldtinnumber text,
    vatdistrictname text,
    gstregistrationtype text,
    vatdealertype text,
    statename text,
    pricelevel text,
    uploadlastrefresh text,
    parent text,
    samplingmethod text,
    samplingstronefactor text,
    ifscode text,
    narration text,
    remoteguid text,
    remotealtguid text,
    enteredby text,
    alteredby text,
    typeofupdateactivity text,
    objectupdateaction text,
    grpdebitparent text,
    grpcreditparent text,
    sysdebitparent text,
    syscreditparent text,
    tdsapplicable text,
    tcsapplicable text,
    gstapplicable text,
    createdby text,
    taxclassificationname text,
    taxtype text,
    billcreditperiod text,
    bankdetails text,
    bankbsrcode text,
    deducteetype text,
    businesstype text,
    typeofnotification text,
    msmeregnumber text,
    countryofresidence text,
    relatedpartyid text,
    relpartyissuingauthority text,
    importerexportercode text,
    emailcc text,
    description text,
    ledaddlalloctype text,
    transporterid text,
    oldpincode text,
    ledgerphone text,
    ledgerfax text,
    ledgercontact text,
    ledgermobile text,
    relationtype text,
    ledgercountryisdcode text,
    mailingnamenative text,
    statenamenative text,
    countrynamenative text,
    basictypeofduty text,
    gsttype text,
    exemptiontype text,
    appropriatefor text,
    subtaxtype text,
    stxnatureofparty text,
    nameonpan text,
    usedfortaxtype text,
    ecommmerchantid text,
    partygstin text,
    gstdutyhead text,
    gstappropriateto text,
    gsttypeofsupply text,
    gstnatureofsupply text,
    cessvaluationmethod text,
    partyoldgstin text,
    oldledstatename text,
    philippinesledvatclass text,
    vatdealernature text,
    paytype text,
    payslipname text,
    attendancetype text,
    leavetype text,
    calculationperiod text,
    roundingmethod text,
    computationtype text,
    calculationtype text,
    paystattype text,
    professionaltaxnumber text,
    userdefinedcalendertype text,
    itnature text,
    itcomponent text,
    notificationnumber text,
    registrationnumber text,
    servicecategory text,
    abatementnotificationno text,
    stxdutyhead text,
    stxclassification text,
    notificationslno text,
    servicetaxapplicable text,
    exciseledgerclassification text,
    exciseregistrationnumber text,
    exciseaccounthead text,
    excisedutytype text,
    excisedutyheadcode text,
    excisealloctype text,
    excisedutyhead text,
    natureofsales text,
    excisenotificationno text,
    exciseimportsregistartionno text,
    exciseapplicability text,
    excisetypeofbranch text,
    excisedefaultremoval text,
    excisenotificationslno text,
    typeoftariff text,
    exciseregno text,
    excisenatureofpurchase text,
    tdsdeducteetypemst text,
    tdsratename text,
    tdsdeducteesectionnumber text,
    panstatus text,
    deducteereference text,
    tdsdeducteetype text,
    itexemptapplicable text,
    taxidentificationno text,
    ledgerfbtcategory text,
    branchcode text,
    clientcode text,
    bankingconfigbank text,
    bankingconfigbankid text,
    bankaccholdername text,
    useforpostype text,
    paymentgateway text,
    typeofintereston text,
    bankconfigifsc text,
    bankconfigmicr text,
    bankconfigshortcode text,
    pymtinstoutputname text,
    productcodetype text,
    salarypymtproductcode text,
    otherpymtproductcode text,
    paymentinstlocation text,
    encrptionlocation text,
    newimflocation text,
    importedimflocation text,
    banknewstatements text,
    bankimportedstatements text,
    bankmicr text,
    corporateusernoecs text,
    corporateusernoach text,
    corporateusername text,
    imfname text,
    payinsbatchname text,
    lastusedbatchname text,
    payinsfilenumperiod text,
    encryptedby text,
    encryptedid text,
    isocurrencycode text,
    bankcapsuleid text,
    salestaxcessapplicable text,
    bankiban text,
    vattaxexemptionnature text,
    vattaxexemptionnumber text,
    oldcountryname text,
    vatapplicable text,
    partybusinesstype text,
    partybusinessstyle text,
    swiftcode text,
    ebankingformat text,
    virtualpaymentaddress text,
    banklastfetchstmtformat text,
    defaulttransfermode text,
    defaultwithdrawvchtype text,
    defaultdepositvchtype text,
    defaultcontravchtype text,
    banklastfetchbalacctnum text,
    bankperfectmatchconfig text,
    defaultnumseriesdeposit text,
    defaultnumserieswithdrawl text,
    defaultnumseriesinternaltransfer text,
    isbillwiseon text,
    iscostcentreson text,
    isintereston text,
    allowinmobile text,
    iscosttrackingon text,
    isbeneficiarycodeon text,
    isexportonvchcreate text,
    plasincomeexpense text,
    ismstfromsync text,
    isupdatingtargetid text,
    isdeleted text,
    issecurityonwhenentered text,
    asoriginal text,
    iscondensed text,
    affectsstock text,
    israteinclusivevat text,
    forpayroll text,
    isabcenabled text,
    iscreditdayschkon text,
    interestonbillwise text,
    overrideinterest text,
    overrideadvinterest text,
    useforvat text,
    ignoretdsexempt text,
    istcsapplicable text,
    istdsapplicable text,
    isfbtapplicable text,
    isgstapplicable text,
    isexciseapplicable text,
    istdsexpense text,
    isedliapplicable text,
    isrelatedparty text,
    useforesieligibility text,
    isinterestincllastday text,
    appropriatetaxvalue text,
    isbehaveasduty text,
    interestincldayofaddition text,
    interestincldayofdeduction text,
    isothterritoryassessee text,
    ignoremismatchwithwarning text,
    useasnotionalbank text,
    behaveaspaymentgateway text,
    overridecreditlimit text,
    isagainstformc text,
    ischequeprintingenabled text,
    ispayupload text,
    ispaybatchonlysal text,
    isbnfcodesupported text,
    allowexportwitherrors text,
    considerpurchaseforexport text,
    istransporter text,
    isecashledger text,
    usefornotionalitc text,
    isecommoperator text,
    overridebasedonrealization text,
    isecdiffinsdate text,
    showinpayslip text,
    useforgratuity text,
    istdsprojected text,
    issalarymulfile text,
    forservicetax text,
    isinputcredit text,
    isexempted text,
    isabatementapplicable text,
    isstxparty text,
    isstxnonrealizedtype text,
    useforkkc text,
    useforsbc text,
    isusedforcvd text,
    ledbelongstonontaxable text,
    isexcisemerchantexporter text,
    ispartyexempted text,
    issezparty text,
    tdsdeducteeisspecialrate text,
    isechequesupported text,
    iseddsupported text,
    hasechequedeliverymode text,
    hasechequedeliveryto text,
    hasechequeprintlocation text,
    hasechequepayablelocation text,
    hasechequebanklocation text,
    hasedddeliverymode text,
    hasedddeliveryto text,
    haseddprintlocation text,
    haseddpayablelocation text,
    haseddbanklocation text,
    isebankingenabled text,
    isexportfileencrypted text,
    isbatchenabled text,
    isproductcodebased text,
    haseddcity text,
    hasechequecity text,
    isfilenameformatsupported text,
    hasclientcode text,
    payinsisbatchapplicable text,
    payinsisfilenumapp text,
    issalarytransgroupedforbrs text,
    isebankingsupported text,
    isscbuae text,
    isbankstatusapp text,
    issalarygrouped text,
    useforpurchasetax text,
    bankisreconcileperfectmatches text,
    ispymtadvonline text,
    ispymtadvccenabled text,
    isincludepymtadvbillwise text,
    audited text,
    samplingnumonefactor text,
    samplingnumtwofactor text,
    errkey text,
    sortposition text,
    alterid text,
    remotealterid text,
    defaultlanguage text,
    rateoftaxcalculation text,
    gratuitymonthdays text,
    gratuitylimitmonths text,
    calculationbasis text,
    roundinglimit text,
    abatementpercentage text,
    tdsdeducteespecialrate text,
    beneficiarycodemaxlength text,
    echequeprintlocationversion text,
    echequepayablelocationversion text,
    eddprintlocationversion text,
    eddpayablelocationversion text,
    payinsrunningfilenum text,
    transactiontypeversion text,
    payinsfilenumlength text,
    openingbalance text,
    samplingamtonefactor text,
    samplingamttwofactor text,
    creditlimit text,
    gratuitylimitamount text,
    odlimit text,
    banklastfetchbalance text,
    updateddatetime text,
    banklastfetchbalancedatetime text,
    servicetaxdetailslist text,
    lbtregndetailslist text,
    vatdetailslist text,
    salestaxcessdetailslist text,
    gstdetailslist text,
    hsndetailslist text,
    msmeregistrationdetailslist text,
    languagenamelist text,
    xbrldetaillist text,
    auditdetailslist text,
    schvidetailslist text,
    excisetariffdetailslist text,
    tcscategorydetailslist text,
    tdscategorydetailslist text,
    slabperiodlist text,
    gratuityperiodlist text,
    additionalcomputationslist text,
    excisejurisdictiondetailslist text,
    excludedtaxationslist text,
    bankallocationslist text,
    paymentdetailslist text,
    bankexportformatslist text,
    transfermodelimitdetailslist text,
    bankledgerbalancedetailslist text,
    billallocationslist text,
    interestcollectionlist text,
    ledgerclosingvalueslist text,
    ledgerauditclasslist text,
    oldauditentrieslist text,
    tdsexemptionruleslist text,
    deductinsamevchruleslist text,
    lowerdeductionlist text,
    stxabatementdetailslist text,
    ledmultiaddresslistlist text,
    stxtaxdetailslist text,
    chequerangelist text,
    defaultvchchequedetailslist text,
    accountauditentrieslist text,
    auditentrieslist text,
    brsimportedinfolist text,
    autobrsconfigslist text,
    bankurentrieslist text,
    defaultchequedetailslist text,
    defaultopeningchequedetailslist text,
    cancelledpayallocationslist text,
    echequeprintlocationlist text,
    echequepayablelocationlist text,
    eddprintlocationlist text,
    eddpayablelocationlist text,
    availabletransactiontypeslist text,
    ledpayinsconfigslist text,
    typecodedetailslist text,
    fieldvalidationdetailslist text,
    inputcrallocslist text,
    tcsmethodofcalculationlist text,
    ledgstregdetailslist text,
    ledmailingdetailslist text,
    gstreconprefixsuffixdetailslist text,
    contactdetailslist text
);


ALTER TABLE public.ledgers OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 33014)
-- Name: query_cache; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.query_cache (
    id uuid NOT NULL,
    user_id character varying NOT NULL,
    prompt text NOT NULL,
    full_prompt text,
    db_schema text NOT NULL,
    generated_sql text NOT NULL,
    sql_result json,
    summary text,
    prompt_hash character varying NOT NULL,
    executed_at timestamp with time zone DEFAULT now(),
    affected_tables character varying[],
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.query_cache OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 33405)
-- Name: stockgroups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stockgroups (
    activefrom text,
    activeto text,
    guid text,
    parent text,
    narration text,
    remoteguid text,
    remotealtguid text,
    enteredby text,
    alteredby text,
    typeofupdateactivity text,
    objectupdateaction text,
    tdsapplicable text,
    tcsapplicable text,
    gstapplicable text,
    costingmethod text,
    valuationmethod text,
    baseunits text,
    additionalunits text,
    excisetaxtype text,
    isbatchwiseon text,
    isperishableon text,
    isaddable text,
    ismstfromsync text,
    isupdatingtargetid text,
    isdeleted text,
    issecurityonwhenentered text,
    asoriginal text,
    ignorephysicaldifference text,
    ignorenegativestock text,
    treatsalesasmanufactured text,
    treatpurchasesasconsumed text,
    treatrejectsasscrap text,
    hasmfgdate text,
    allowuseofexpireditems text,
    ignorebatches text,
    ignoregodowns text,
    errkey text,
    alterid text,
    remotealterid text,
    denominator text,
    conversion text,
    updateddatetime text,
    servicetaxdetailslist text,
    vatdetailslist text,
    salestaxcessdetailslist text,
    gstdetailslist text,
    hsndetailslist text,
    languagenamelist text,
    schvidetailslist text,
    excisetariffdetailslist text,
    tcscategorydetailslist text,
    tdscategorydetailslist text
);


ALTER TABLE public.stockgroups OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 33365)
-- Name: stockitem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stockitem (
    oldauditentryidslist text,
    activefrom text,
    activeto text,
    priceleveldate text,
    guid text,
    pricelevel text,
    parent text,
    category text,
    narration text,
    remoteguid text,
    remotealtguid text,
    enteredby text,
    alteredby text,
    typeofupdateactivity text,
    objectupdateaction text,
    tdsapplicable text,
    tcsapplicable text,
    gstapplicable text,
    taxclassificationname text,
    description text,
    gsttypeofsupply text,
    servicetaxapplicable text,
    exciseapplicability text,
    salestaxcessapplicable text,
    vatapplicable text,
    ledgername text,
    costingmethod text,
    valuationmethod text,
    baseunits text,
    additionalunits text,
    excisetaxtype text,
    natureofitem text,
    exciseitemclassification text,
    oldbasictarifftype text,
    tcscategory text,
    basictarifftype text,
    vatcommodity text,
    entrytaxcommodity text,
    vatbaseunit text,
    vattrailunit text,
    vatschdlentrtyno text,
    reorderperiod text,
    reorderroundtype text,
    minorderperiod text,
    minorderroundtype text,
    gstrepuom text,
    gstconvunit text,
    iscostcentreson text,
    isbatchwiseon text,
    isperishableon text,
    isentrytaxapplicable text,
    iscosttrackingon text,
    ismstfromsync text,
    isupdatingtargetid text,
    isdeleted text,
    issecurityonwhenentered text,
    asoriginal text,
    israteinclusivevat text,
    ignorephysicaldifference text,
    ignorenegativestock text,
    treatsalesasmanufactured text,
    treatpurchasesasconsumed text,
    treatrejectsasscrap text,
    hasmfgdate text,
    allowuseofexpireditems text,
    ignorebatches text,
    ignoregodowns text,
    adjdiffinfirstsaleledger text,
    adjdiffinfirstpurcledger text,
    calconmrp text,
    excludejrnlforvaluation text,
    ismrpincloftax text,
    isaddltaxexempt text,
    issupplementrydutyon text,
    gvatisexciseappl text,
    isadditionaltax text,
    iscessexempted text,
    reorderashigher text,
    minorderashigher text,
    isexcisecalculateonmrp text,
    inclusivetax text,
    gstcalcslabonmrp text,
    modifymrprate text,
    errkey text,
    alterid text,
    remotealterid text,
    denominator text,
    conversion text,
    rateofmrp text,
    basicrateofexcise text,
    rateofentrytax text,
    rateofvat text,
    rateofsat text,
    vatbaseno text,
    vattrailno text,
    vatactualratio text,
    reorderperiodlength text,
    reorderroundlimit text,
    minorderperiodlength text,
    minorderroundlimit text,
    gstitemunits text,
    gstrepunits text,
    openingbalance text,
    openingvalue text,
    basicvalue text,
    basicqty text,
    reorderbase text,
    minimumorderbase text,
    openingrate text,
    updateddatetime text,
    servicetaxdetailslist text,
    vatdetailslist text,
    salestaxcessdetailslist text,
    gstdetailslist text,
    hsndetailslist text,
    languagenamelist text,
    schvidetailslist text,
    excisetariffdetailslist text,
    tcscategorydetailslist text,
    tdscategorydetailslist text,
    excludedtaxationslist text,
    oldauditentrieslist text,
    accountauditentrieslist text,
    auditentrieslist text,
    oldmrpdetailslist text,
    vatclassificationdetailslist text,
    mrpdetailslist text,
    reportinguomdetailslist text,
    componentlistlist text,
    additionalledgerslist text,
    saleslistlist text,
    purchaselistlist text,
    fullpricelistlist text,
    batchallocationslist text,
    traderexcisedutieslist text,
    standardcostlistlist text,
    standardpricelistlist text,
    exciseitemgodownlist text,
    multicomponentlistlist text,
    lbtdetailslist text,
    pricelevellistlist text
);


ALTER TABLE public.stockitem OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 33370)
-- Name: voucherledgerentries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.voucherledgerentries (
    guid text,
    taxclassificationname text,
    appropriatefor text,
    ledgername text,
    statnaturename text,
    statclassificationname text,
    exciseclassificationname text,
    iszrbasicservice text,
    vatcommodityname text,
    schedule text,
    scheduleserialnumber text,
    vatcommoditycode text,
    tdspartyname text,
    vatpartyorgname text,
    vatcalculationtype text,
    vatworkscontracttype text,
    vatwcdescription text,
    gstclass text,
    gstovrdnclassification text,
    gstovrdnnature text,
    gstovrdnineligibleitc text,
    gstovrdnisrevchargeappl text,
    gstovrdntaxability text,
    gsthsnsaccode text,
    gstovrdnstorednature text,
    gsthsnname text,
    gsthsndescription text,
    isdeemedpositive text,
    ledgerfromitem text,
    ispartyledger text,
    islastdeemedpositive text,
    iscapvatnotclaimed text,
    rateofaddlvat text,
    rateofcessonvat text,
    vattaxrate text,
    vatitemqty text,
    vatwcdeductrate text,
    vatwcdeductionrate text,
    gsttaxrate text,
    amount text,
    crdr text,
    cessassvalonclass text,
    addnlvatclassamt text,
    vatassessablevalue text,
    vatwccostofland text,
    vatwcdedlabourcharges text,
    vatwcotherdeductionamt text,
    vatwcvalueoftaxfreegoods text,
    vatwcothercharges text,
    vatwcsubcontractoramt text,
    vatwcdeductamt text,
    wctotaldeductionamt text,
    vatwcdeductionamount text,
    originvgoodsvalue text,
    cenvatcaptinputamt text,
    gstassessablevalue text,
    igstliability text,
    cgstliability text,
    sgstliability text,
    gstcessliability text,
    gstovrdnassessablevalue text,
    gstassblvalue text,
    vatexpamount text
);


ALTER TABLE public.voucherledgerentries OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 33375)
-- Name: vouchers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vouchers (
    date text,
    guid text,
    requestorrule text,
    vouchertypename text,
    vouchernumber text,
    serialmaster text,
    areserialmaster text,
    numberingstyle text,
    persistedview text,
    isdeleted text,
    asoriginal text,
    isdeemedpositive text,
    isinvoice text,
    aspayslip text,
    isdeletedvchretained text,
    isnegisposset text,
    masterid text,
    voucherkey text,
    voucherretainkey text,
    reuseholeid text,
    totalamount text,
    crdr text,
    vouchernumberseries text
);


ALTER TABLE public.vouchers OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 33390)
-- Name: vouchertypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vouchertypes (
    samplingdateonefactor text,
    samplingdatetwofactor text,
    activefrom text,
    activeto text,
    guid text,
    lastwhatsapptemplate text,
    parent text,
    mailingname text,
    samplingmethod text,
    samplingstronefactor text,
    narration text,
    enteredby text,
    alteredby text,
    typeofupdateactivity text,
    objectupdateaction text,
    requestorrule text,
    billcreditperiod text,
    natureofsales text,
    taxunitname text,
    vchprinttitle text,
    vchprintdecl text,
    numberingmethod text,
    vchdevicetype text,
    vchdeviceno text,
    posmessageline1 text,
    posmessageline2 text,
    exciseunitname text,
    vchprintaddldecl text,
    lbtdeclaration text,
    posreturntype text,
    vchprintjurisdiction text,
    vchprintbankname text,
    excisebookname text,
    isuseforexcise text,
    vchprinttitlenative text,
    vchprintdeclnative text,
    defaultgstregistration text,
    defaultexciseregistration text,
    defaultstregistration text,
    vatinvoiceformat text,
    contracontra text,
    paymentcontra text,
    receiptcontra text,
    journalcontra text,
    cnotecontra text,
    dnotecontra text,
    salescontra text,
    purchasecontra text,
    creditcstctr text,
    debitcstctr text,
    previouspurchase text,
    previoussales text,
    previousgodown text,
    prevnarration text,
    lastnumber text,
    lastvchnumseries text,
    lastgsttaxunit text,
    usezeroentries text,
    isupdatingtargetid text,
    isdeleted text,
    issecurityonwhenentered text,
    asoriginal text,
    isdeemedpositive text,
    affectsstock text,
    isactive text,
    preventduplicates text,
    prefillzero text,
    printaftersave text,
    formalreceipt text,
    isoptional text,
    asmfgjrnl text,
    effectivedate text,
    commonnarration text,
    multinarration text,
    istaxinvoice text,
    getpymtlinkaftersave text,
    useforposinvoice text,
    useforexcisetraderinvoice text,
    useforexcise text,
    useforjobwork text,
    isforjobworkin text,
    allowconsumption text,
    useforexcisegoods text,
    useforexcisesupplementary text,
    isdefaultallocenabled text,
    trackaddlcost text,
    diffactqty text,
    discappl text,
    isewayapplicable text,
    generateewaybillaftersave text,
    excludeewaybillforupload text,
    printbookno text,
    showdeletedvchnum text,
    allowmultipletaxunitsperseries text,
    whatsappaftersave text,
    samplingnumonefactor text,
    samplingnumtwofactor text,
    errkey text,
    sortposition text,
    alterid text,
    beginningnumber text,
    widthofnumber text,
    samplingamtonefactor text,
    samplingamttwofactor text,
    updateddatetime text,
    tempnumberingmethod text,
    tempnumberingsubmethod text,
    languagenamelist text,
    auditdetailslist text,
    excisetariffdetailslist text,
    prefixlistlist text,
    suffixlistlist text,
    restartfromlistlist text,
    voucherclasslistlist text,
    productcodedetailslist text,
    vchnumseriesidlist text,
    vouchernumberserieslist text
);


ALTER TABLE public.vouchertypes OWNER TO postgres;

--
-- TOC entry 3388 (class 0 OID 33395)
-- Dependencies: 221
-- Data for Name: currency; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.currency (activefrom, activeto, guid, mailingname, narration, remoteguid, remotealtguid, enteredby, alteredby, typeofupdateactivity, objectupdateaction, originalname, isocurrencycode, expandedsymbol, decimalsymbol, ismstfromsync, isupdatingtargetid, isdeleted, issecurityonwhenentered, asoriginal, issuffix, hasspace, inmillions, errkey, alterid, remotealterid, decimalplaces, decimalplacesforprinting, updateddatetime, dailystdrateslist, dailybuyingrateslist, dailysellingrateslist) FROM stdin;
		667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-0000001d	INR								?		INR	paise					No	No	Yes	No	0	 1397	0	 2	 2	000000000			
\.


--
-- TOC entry 3389 (class 0 OID 33400)
-- Dependencies: 222
-- Data for Name: godown; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.godown (activefrom, activeto, exciseregistrationdate, lutdateofissue, lutexpirydate, bonddateofissue, bondexpirydate, guid, pincode, phonenumber, exciserange, exciserangeaddress, excisedivisionaddress, excisecommissionerate, exciserangecode, excisedivisioncode, statename, parent, narration, remoteguid, remotealtguid, enteredby, alteredby, typeofupdateactivity, objectupdateaction, importerexportercode, exciseregno, jobname, exciseregistrationtype, excisemailingname, excisemanufacturertype, exciselargetaxpayer, excisedivisionname, excisecomsnratecode, excisecomsnrateaddress, are1serialmaster, are2serialmaster, are3serialmaster, lutnumber, bondnumber, authorityname, authorityaddress, taxunitname, typeofconsignmentagent, itemstate, excisearename, traderrgnoprefix, traderrgnosuffix, ismstfromsync, isupdatingtargetid, isdeleted, issecurityonwhenentered, asoriginal, hasnospace, hasnostock, isexternal, isinternal, enableexport, isprimaryexciseunit, allowexportrebate, istraderrgnumberon, errkey, alterid, remotealterid, updateddatetime, languagenamelist, schvidetailslist, excisetariffdetailslist, serialnumberlistlist, excisemfgdetailslist, exciselutdetailslist, excisebonddetailslist, exciserangedetailslist, excisedivisiondetailslist, excisecommissioneratedetailslist) FROM stdin;
							667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-0000003e										 Primary										 Primary																									No	No	No	No	No					0	 507	0	000000000	Main Location 1033									
\.


--
-- TOC entry 3385 (class 0 OID 33380)
-- Dependencies: 218
-- Data for Name: ledgergroups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ledgergroups (samplingdateonefactor, samplingdatetwofactor, activefrom, activeto, guid, parent, samplingmethod, samplingstronefactor, narration, enteredby, alteredby, typeofupdateactivity, objectupdateaction, requestorrule, basicgroupiscalculable, addlalloctype, grpdebitparent, grpcreditparent, sysdebitparent, syscreditparent, balancingtype, tdsapplicable, tcsapplicable, gstapplicable, isbillwiseon, iscostcentreson, isaddable, isupdatingtargetid, isdeleted, issecurityonwhenentered, asoriginal, issubledger, isrevenue, affectsgrossprofit, isdeemedpositive, tracknegativebalances, iscondensed, affectsstock, isgroupforloanrcpt, isgroupforloanpymnt, israteinclusivevat, isinvdetailsenable, samplingnumonefactor, samplingnumtwofactor, errkey, sortposition, alterid, samplingamtonefactor, samplingamttwofactor, updateddatetime, tempgstcgstrate, tempgstsgstrate, tempgstigstrate, tempgststatecessrate, tempapplicablefrom, tempisreversechargeappl, tempgsteligibleitc, tempgstinclexpforslabtax, tempgstcalcslabonmrp, tempgstclassification, tempgsttaxablility, tempgstnatureoftransaction, tempsrcofgstdetails, tempgsttaxrate, tempgstcessrate, tempgstcessqtyrate, tempgstcessvaltype, tempgstslabcessvaltype, tempgstslabcessrate, tempgstslabcessqtyrate, tempgstslabstatecessrate, tempgsthsnapplfrom, tempsrcofhsndetails, tempgsthsnclassification, tempgsthsncode, tempgsthsndescription, tempgsttaxablilitygstclassif, tempgstnatureoftransactiongstclassif, tempgstigstrategstclassif, tempgstcgstrategstclassif, tempgstsgstrategstclassif, tempgstcessvaltypegstclassif, tempgstcessqtyrategstclassif, tempgststatecessrategstclassif, tempisreversechargeapplgstclassif, tempgsteligibleitcgstclassif, tempgstcessrategstclassif, tempgsthsncodegstclassif, tempgsthsndescriptiongstclassif, tempgroupnature, tempaffectsgp, tempisvatfieldsedited, tempappldate, tempclassification, tempnature, temppartyentity, tempbusinessnature, tempvatrate, tempaddltax, tempcessonvat, temptaxtype, tempmajorcommodityname, tempcommodityname, tempcommoditycode, tempsubcommoditycode, tempuom, temptypeofgoods, temptradename, tempgoodsnature, tempschedule, tempscheduleslno, tempisinvdetailsenable, templocalvatrate, tempvaluationtype, tempiscalconqty, servicetaxdetailslist, vatdetailslist, salestaxcessdetailslist, gstdetailslist, hsndetailslist, languagenamelist, xbrldetaillist, auditdetailslist, schvidetailslist, excisetariffdetailslist, tcscategorydetailslist, tdscategorydetailslist, gstclassfnigstrateslist, extariffdutyheaddetailslist, tempgstitemslabrateslist) FROM stdin;
				667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-00000016	Current Assets																			No	No	No	No	No	No	Yes	No	No	No	Yes	Yes	No	No	No	No	No	No	0	0	0	 220	 1113			000000000	0	0	0	0										0	0	0			0	0	0								0	0	0		0	0			0											0	0	0													0								Bank Accounts 1033									
				667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-0000000b	Loans (Liability)																			No	No	No	No	No	No	Yes	No	No	No	No	No	No	No	No	No	No	No	0	0	0	 110	 1114			000000000	0	0	0	0										0	0	0			0	0	0								0	0	0		0	0			0											0	0	0													0								Bank OD A/cBank OCC A/c 1033									
				667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-00000007																				No	No	No	No	No	No	Yes	No	No	No	No	No	No	No	No	No	No	No	0	0	0	 70	 1115			000000000	0	0	0	0										0	0	0			0	0	0								0	0	0		0	0			0											0	0	0													0								Branch / Divisions 1033									
				667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-00000001																				No	No	No	No	No	No	Yes	No	No	No	No	No	No	No	No	No	No	No	0	0	0	 10	 1116			000000000	0	0	0	0										0	0	0			0	0	0								0	0	0		0	0			0											0	0	0													0								Capital Account 1033									
				667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-00000015	Current Assets																			No	No	No	No	No	No	Yes	No	No	No	Yes	Yes	No	No	No	No	No	No	0	0	0	 210	 1117			000000000	0	0	0	0										0	0	0			0	0	0								0	0	0		0	0			0											0	0	0													0								Cash-in-Hand 1033									
				667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-00000006																				Yes	No	No	No	No	No	Yes	No	No	No	Yes	No	No	No	No	No	No	No	0	0	0	 60	 1118			000000000	0	0	0	0										0	0	0			0	0	0								0	0	0		0	0			0											0	0	0													0						20180401As per Company/GroupNoNoNoYesNo000000000000 AnyCGSTBased on Value000SGST/UTGSTBased on Value000IGSTBased on Value000Cess Not Applicable000State CessBased on Value000	20180401As per Company/Group	Current Assets 1033									
				667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-00000003																				Yes	No	No	No	No	No	Yes	No	No	No	No	No	No	No	No	No	No	No	0	0	0	 30	 1119			000000000	0	0	0	0										0	0	0			0	0	0								0	0	0		0	0			0											0	0	0													0						20180401As per Company/GroupNoNoNoYesNo000000000000 AnyCGSTBased on Value000SGST/UTGSTBased on Value000IGSTBased on Value000Cess Not Applicable000State CessBased on Value000	20180401As per Company/Group	Current Liabilities 1033									
				667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-00000012	Current Assets																			No	No	No	No	No	No	Yes	No	No	No	Yes	No	No	No	No	No	No	No	0	0	0	 180	 1120			000000000	0	0	0	0										0	0	0			0	0	0								0	0	0		0	0			0											0	0	0													0								Deposits (Asset) 1033									
				667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-0000000e	Current Liabilities																			Yes	No	No	No	No	No	Yes	No	No	No	No	No	No	No	No	No	No	No	0	0	0	 140	 1121			000000000	0	0	0	0										0	0	0			0	0	0								0	0	0		0	0			0											0	0	0													0								Duties & Taxes 1033									
				667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-00000004																				No	No	No	No	No	No	Yes	No	No	No	Yes	No	No	No	No	No	No	No	0	0	0	 40	 1122			000000000	0	0	0	0										0	0	0			0	0	0								0	0	0		0	0			0											0	0	0													0						20180401As per Company/GroupNoNoNoYesNo000000000000 AnyCGSTBased on Value000SGST/UTGSTBased on Value000IGSTBased on Value000Cess Not Applicable000State CessBased on Value000	20180401As per Company/Group	Fixed Assets 1033									
				667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-0000001c																				No	Yes	No	No	No	No	Yes	No	Yes	No	Yes	No	No	No	No	No	No	No	0	0	0	 280	 1123			000000000	0	0	0	0										0	0	0			0	0	0								0	0	0		0	0			0											0	0	0													0						20180401As per Company/GroupNoNoNoYesNo000000000000 AnyCGSTBased on Value000SGST/UTGSTBased on Value000IGSTBased on Value000Cess Not Applicable000State CessBased on Value000	20180401As per Company/Group	Indirect ExpensesExpenses (Indirect) 1033									
				667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-0000001b																				No	Yes	No	No	No	No	Yes	No	Yes	No	No	No	No	No	No	No	No	No	0	0	0	 270	 1124			000000000	0	0	0	0										0	0	0			0	0	0								0	0	0		0	0			0											0	0	0													0						20180401As per Company/GroupNoNoNoYesNo000000000000 AnyCGSTBased on Value000SGST/UTGSTBased on Value000IGSTBased on Value000Cess Not Applicable000State CessBased on Value000	20180401As per Company/Group	Indirect IncomesIncome (Indirect) 1033									
				667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-00000005																				No	No	No	No	No	No	Yes	No	No	No	Yes	No	No	No	No	No	No	No	0	0	0	 50	 1125			000000000	0	0	0	0										0	0	0			0	0	0								0	0	0		0	0			0											0	0	0													0						20180401As per Company/GroupNoNoNoYesNo000000000000 AnyCGSTBased on Value000SGST/UTGSTBased on Value000IGSTBased on Value000Cess Not Applicable000State CessBased on Value000	20180401As per Company/Group	Investments 1033									
				667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-00000013	Current Assets																			No	No	No	No	No	No	Yes	No	No	No	Yes	No	No	No	No	No	No	No	0	0	0	 190	 1126			000000000	0	0	0	0										0	0	0			0	0	0								0	0	0		0	0			0											0	0	0													0						20180401As per Company/GroupNoNoNoYesNo000000000000 AnyCGSTBased on Value000SGST/UTGSTBased on Value000IGSTBased on Value000Cess Not Applicable000State CessBased on Value000	20180401As per Company/Group	Loans & Advances (Asset) 1033									
				667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-00000002																				No	No	No	No	No	No	Yes	No	No	No	No	No	No	No	No	No	No	No	0	0	0	 20	 1127			000000000	0	0	0	0										0	0	0			0	0	0								0	0	0		0	0			0											0	0	0													0						20180401As per Company/GroupNoNoNoYesNo000000000000 AnyCGSTBased on Value000SGST/UTGSTBased on Value000IGSTBased on Value000Cess Not Applicable000State CessBased on Value000	20180401As per Company/Group	Loans (Liability) 1033									
				667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-00000008																				No	No	No	No	No	No	Yes	No	No	No	Yes	No	No	No	No	No	No	No	0	0	0	 80	 1128			000000000	0	0	0	0										0	0	0			0	0	0								0	0	0		0	0			0											0	0	0													0						20180401As per Company/GroupNoNoNoYesNo000000000000 AnyCGSTBased on Value000SGST/UTGSTBased on Value000IGSTBased on Value000Cess Not Applicable000State CessBased on Value000	20180401As per Company/Group	Misc. Expenses (ASSET) 1033									
				667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-0000000f	Current Liabilities																			No	No	No	No	No	No	Yes	No	No	No	No	No	No	No	No	No	No	No	0	0	0	 150	 1129			000000000	0	0	0	0										0	0	0			0	0	0								0	0	0		0	0			0											0	0	0													0						20180401As per Company/GroupNoNoNoYesNo000000000000 AnyCGSTBased on Value000SGST/UTGSTBased on Value000IGSTBased on Value000Cess Not Applicable000State CessBased on Value000	20180401As per Company/Group	Provisions 1033									
				667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-00000018																				No	Yes	No	No	No	No	Yes	No	Yes	Yes	Yes	No	No	Yes	No	No	No	No	0	0	0	 240	 1130			000000000	0	0	0	0										0	0	0			0	0	0								0	0	0		0	0			0											0	0	0													0						20180401As per Company/GroupNoNoNoYesNo000000000000 AnyCGSTBased on Value000SGST/UTGSTBased on Value000IGSTBased on Value000Cess Not Applicable000State CessBased on Value000	20180401As per Company/Group	Purchase Accounts 1033									
				667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-0000000a	Capital Account																			No	No	No	No	No	No	Yes	No	No	No	No	No	No	No	No	No	No	No	0	0	0	 100	 1131			000000000	0	0	0	0										0	0	0			0	0	0								0	0	0		0	0			0											0	0	0													0								Reserves & SurplusRetained Earnings 1033									
				667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-00000017																				No	Yes	No	No	No	No	Yes	No	Yes	Yes	No	No	No	Yes	No	No	No	No	0	0	0	 230	 1132			000000000	0	0	0	0										0	0	0			0	0	0								0	0	0		0	0			0											0	0	0													0						20180401As per Company/GroupNoNoNoYesNo000000000000 AnyCGSTBased on Value000SGST/UTGSTBased on Value000IGSTBased on Value000Cess Not Applicable000State CessBased on Value000	20180401As per Company/Group	Sales Accounts 1033									
				667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-0000000c	Loans (Liability)																			No	No	No	No	No	No	Yes	No	No	No	No	No	No	No	No	No	No	No	0	0	0	 120	 1133			000000000	0	0	0	0										0	0	0			0	0	0								0	0	0		0	0			0											0	0	0													0						20180401As per Company/GroupNoNoNoYesNo000000000000 AnyCGSTBased on Value000SGST/UTGSTBased on Value000IGSTBased on Value000Cess Not Applicable000State CessBased on Value000	20180401As per Company/Group	Secured Loans 1033									
				667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-00000011	Current Assets																			No	No	No	No	No	No	Yes	No	No	No	Yes	No	No	No	No	No	No	No	0	0	0	 170	 1134			000000000	0	0	0	0										0	0	0			0	0	0								0	0	0		0	0			0											0	0	0													0								Stock-in-Hand 1033									
				667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-00000010	Current Liabilities																			No	Yes	No	No	No	No	Yes	Yes	No	No	No	No	No	No	No	No	No	No	0	0	0	 160	 1135			000000000	0	0	0	0										0	0	0			0	0	0								0	0	0		0	0			0											0	0	0													0								Sundry Creditors 1033									
				667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-00000014	Current Assets																			No	No	No	No	No	No	Yes	Yes	No	No	Yes	No	No	No	No	No	No	No	0	0	0	 200	 1136			000000000	0	0	0	0										0	0	0			0	0	0								0	0	0		0	0			0											0	0	0													0								Sundry Debtors 1033									
				667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-00000009																				No	No	No	No	No	No	Yes	No	No	No	No	No	No	No	No	No	No	No	0	0	0	 90	 1137			000000000	0	0	0	0										0	0	0			0	0	0								0	0	0		0	0			0											0	0	0													0								Suspense A/c 1033									
				667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-0000000d	Loans (Liability)																			No	No	No	No	No	No	Yes	No	No	No	No	No	No	No	No	No	No	No	0	0	0	 130	 1138			000000000	0	0	0	0										0	0	0			0	0	0								0	0	0		0	0			0											0	0	0													0						20180401As per Company/GroupNoNoNoYesNo000000000000 AnyCGSTBased on Value000SGST/UTGSTBased on Value000IGSTBased on Value000Cess Not Applicable000State CessBased on Value000	20180401As per Company/Group	Unsecured Loans 1033									
\.


--
-- TOC entry 3386 (class 0 OID 33385)
-- Dependencies: 219
-- Data for Name: ledgers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ledgers (oldauditentryidslist, startingfrom, stregdate, lbtregndate, vatregistrationdate, cstregistrationdate, samplingdateonefactor, samplingdatetwofactor, activefrom, activeto, createddate, alteredon, vatapplicabledate, exciseregistrationdate, panapplicablefrom, payinsrunningfiledate, vattaxexemptiondate, banklastimportstmtdate, guid, currencyname, email, priorstatename, website, incometaxnumber, salestaxnumber, interstatestnumber, vattinnumber, exciserange, excisedivision, excisecommissionerate, lbtregnno, lbtzone, exportimportcode, branchname, interstateoldstnumber, vatoldtinnumber, vatdistrictname, gstregistrationtype, vatdealertype, statename, pricelevel, uploadlastrefresh, parent, samplingmethod, samplingstronefactor, ifscode, narration, remoteguid, remotealtguid, enteredby, alteredby, typeofupdateactivity, objectupdateaction, grpdebitparent, grpcreditparent, sysdebitparent, syscreditparent, tdsapplicable, tcsapplicable, gstapplicable, createdby, taxclassificationname, taxtype, billcreditperiod, bankdetails, bankbsrcode, deducteetype, businesstype, typeofnotification, msmeregnumber, countryofresidence, relatedpartyid, relpartyissuingauthority, importerexportercode, emailcc, description, ledaddlalloctype, transporterid, oldpincode, ledgerphone, ledgerfax, ledgercontact, ledgermobile, relationtype, ledgercountryisdcode, mailingnamenative, statenamenative, countrynamenative, basictypeofduty, gsttype, exemptiontype, appropriatefor, subtaxtype, stxnatureofparty, nameonpan, usedfortaxtype, ecommmerchantid, partygstin, gstdutyhead, gstappropriateto, gsttypeofsupply, gstnatureofsupply, cessvaluationmethod, partyoldgstin, oldledstatename, philippinesledvatclass, vatdealernature, paytype, payslipname, attendancetype, leavetype, calculationperiod, roundingmethod, computationtype, calculationtype, paystattype, professionaltaxnumber, userdefinedcalendertype, itnature, itcomponent, notificationnumber, registrationnumber, servicecategory, abatementnotificationno, stxdutyhead, stxclassification, notificationslno, servicetaxapplicable, exciseledgerclassification, exciseregistrationnumber, exciseaccounthead, excisedutytype, excisedutyheadcode, excisealloctype, excisedutyhead, natureofsales, excisenotificationno, exciseimportsregistartionno, exciseapplicability, excisetypeofbranch, excisedefaultremoval, excisenotificationslno, typeoftariff, exciseregno, excisenatureofpurchase, tdsdeducteetypemst, tdsratename, tdsdeducteesectionnumber, panstatus, deducteereference, tdsdeducteetype, itexemptapplicable, taxidentificationno, ledgerfbtcategory, branchcode, clientcode, bankingconfigbank, bankingconfigbankid, bankaccholdername, useforpostype, paymentgateway, typeofintereston, bankconfigifsc, bankconfigmicr, bankconfigshortcode, pymtinstoutputname, productcodetype, salarypymtproductcode, otherpymtproductcode, paymentinstlocation, encrptionlocation, newimflocation, importedimflocation, banknewstatements, bankimportedstatements, bankmicr, corporateusernoecs, corporateusernoach, corporateusername, imfname, payinsbatchname, lastusedbatchname, payinsfilenumperiod, encryptedby, encryptedid, isocurrencycode, bankcapsuleid, salestaxcessapplicable, bankiban, vattaxexemptionnature, vattaxexemptionnumber, oldcountryname, vatapplicable, partybusinesstype, partybusinessstyle, swiftcode, ebankingformat, virtualpaymentaddress, banklastfetchstmtformat, defaulttransfermode, defaultwithdrawvchtype, defaultdepositvchtype, defaultcontravchtype, banklastfetchbalacctnum, bankperfectmatchconfig, defaultnumseriesdeposit, defaultnumserieswithdrawl, defaultnumseriesinternaltransfer, isbillwiseon, iscostcentreson, isintereston, allowinmobile, iscosttrackingon, isbeneficiarycodeon, isexportonvchcreate, plasincomeexpense, ismstfromsync, isupdatingtargetid, isdeleted, issecurityonwhenentered, asoriginal, iscondensed, affectsstock, israteinclusivevat, forpayroll, isabcenabled, iscreditdayschkon, interestonbillwise, overrideinterest, overrideadvinterest, useforvat, ignoretdsexempt, istcsapplicable, istdsapplicable, isfbtapplicable, isgstapplicable, isexciseapplicable, istdsexpense, isedliapplicable, isrelatedparty, useforesieligibility, isinterestincllastday, appropriatetaxvalue, isbehaveasduty, interestincldayofaddition, interestincldayofdeduction, isothterritoryassessee, ignoremismatchwithwarning, useasnotionalbank, behaveaspaymentgateway, overridecreditlimit, isagainstformc, ischequeprintingenabled, ispayupload, ispaybatchonlysal, isbnfcodesupported, allowexportwitherrors, considerpurchaseforexport, istransporter, isecashledger, usefornotionalitc, isecommoperator, overridebasedonrealization, isecdiffinsdate, showinpayslip, useforgratuity, istdsprojected, issalarymulfile, forservicetax, isinputcredit, isexempted, isabatementapplicable, isstxparty, isstxnonrealizedtype, useforkkc, useforsbc, isusedforcvd, ledbelongstonontaxable, isexcisemerchantexporter, ispartyexempted, issezparty, tdsdeducteeisspecialrate, isechequesupported, iseddsupported, hasechequedeliverymode, hasechequedeliveryto, hasechequeprintlocation, hasechequepayablelocation, hasechequebanklocation, hasedddeliverymode, hasedddeliveryto, haseddprintlocation, haseddpayablelocation, haseddbanklocation, isebankingenabled, isexportfileencrypted, isbatchenabled, isproductcodebased, haseddcity, hasechequecity, isfilenameformatsupported, hasclientcode, payinsisbatchapplicable, payinsisfilenumapp, issalarytransgroupedforbrs, isebankingsupported, isscbuae, isbankstatusapp, issalarygrouped, useforpurchasetax, bankisreconcileperfectmatches, ispymtadvonline, ispymtadvccenabled, isincludepymtadvbillwise, audited, samplingnumonefactor, samplingnumtwofactor, errkey, sortposition, alterid, remotealterid, defaultlanguage, rateoftaxcalculation, gratuitymonthdays, gratuitylimitmonths, calculationbasis, roundinglimit, abatementpercentage, tdsdeducteespecialrate, beneficiarycodemaxlength, echequeprintlocationversion, echequepayablelocationversion, eddprintlocationversion, eddpayablelocationversion, payinsrunningfilenum, transactiontypeversion, payinsfilenumlength, openingbalance, samplingamtonefactor, samplingamttwofactor, creditlimit, gratuitylimitamount, odlimit, banklastfetchbalance, updateddatetime, banklastfetchbalancedatetime, servicetaxdetailslist, lbtregndetailslist, vatdetailslist, salestaxcessdetailslist, gstdetailslist, hsndetailslist, msmeregistrationdetailslist, languagenamelist, xbrldetaillist, auditdetailslist, schvidetailslist, excisetariffdetailslist, tcscategorydetailslist, tdscategorydetailslist, slabperiodlist, gratuityperiodlist, additionalcomputationslist, excisejurisdictiondetailslist, excludedtaxationslist, bankallocationslist, paymentdetailslist, bankexportformatslist, transfermodelimitdetailslist, bankledgerbalancedetailslist, billallocationslist, interestcollectionlist, ledgerclosingvalueslist, ledgerauditclasslist, oldauditentrieslist, tdsexemptionruleslist, deductinsamevchruleslist, lowerdeductionlist, stxabatementdetailslist, ledmultiaddresslistlist, stxtaxdetailslist, chequerangelist, defaultvchchequedetailslist, accountauditentrieslist, auditentrieslist, brsimportedinfolist, autobrsconfigslist, bankurentrieslist, defaultchequedetailslist, defaultopeningchequedetailslist, cancelledpayallocationslist, echequeprintlocationlist, echequepayablelocationlist, eddprintlocationlist, eddpayablelocationlist, availabletransactiontypeslist, ledpayinsconfigslist, typecodedetailslist, fieldvalidationdetailslist, inputcrallocslist, tcsmethodofcalculationlist, ledgstregdetailslist, ledmailingdetailslist, gstreconprefixsuffixdetailslist, contactdetailslist) FROM stdin;
-1																		667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000000c0	?																			Regular				Purchase Accounts						667653ae-9a3a-48fa-94ee-ee5e6c0c80b8											 Applicable		 Not Applicable	Others														 Not Applicable													 Not Applicable		 Not Applicable									Services							 Not Applicable								 Not Applicable							 Not Applicable									 Not Applicable													 Not Applicable									 Not Applicable																																							 Applicable																No	Yes	No	No	No		No	No					No	No	Yes		No			No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No		Yes					No				No	No	No	No	No		No	No	No	No	No		No	No	No						No													No																					0	0	0	 1000	 976	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00							000000000	000000000					20180401As per Company/GroupYes0 AnyCGSTBased on Value00SGST/UTGSTBased on Value00IGSTBased on Value00Cess Not Applicable00State CessBased on Value00	20180401As per Company/Group		12% Net Amt GST (Exp) 1033																																																			
-1																		667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000000b8	?																			Regular				Purchase Accounts						667653ae-9a3a-48fa-94ee-ee5e6c0c80b8											 Applicable		 Not Applicable	Others														 Not Applicable													 Not Applicable		 Not Applicable									Services							 Not Applicable								 Not Applicable							 Not Applicable									 Not Applicable													 Not Applicable									 Not Applicable																																							 Applicable																No	Yes	No	No	No		No	No					No	No	Yes		No			No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No		Yes					No				No	No	No	No	No		No	No	No	No	No		No	No	No						No													No																					0	0	0	 1000	 977	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00							000000000	000000000					20180401As per Company/GroupYes0 AnyCGSTBased on Value00SGST/UTGSTBased on Value00IGSTBased on Value00Cess Not Applicable00State CessBased on Value00	20180401As per Company/Group		18% Net Amt GST 1033																																																			
-1																		667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-00000121	?																							Purchase Accounts						667653ae-9a3a-48fa-94ee-ee5e6c0c80b8											 Applicable		 Not Applicable	Others														 Not Applicable													 Not Applicable		 Not Applicable									Services							 Not Applicable								 Not Applicable							 Not Applicable									 Not Applicable													 Not Applicable									 Not Applicable																																							 Applicable																No	Yes	No	No	No		No	No					No	No	Yes		No			No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No		Yes					No				No	No	No	No	No		No	No	No	No	No		No	No	No						No													No																					0	0	0	 1000	 978	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00							000000000	000000000					20180401TaxableLocal Purchase - TaxableSpecify Details Here0 AnyCGSTBased on Value 90SGST/UTGSTBased on Value 90IGSTBased on Value 180Cess Not Applicable00State CessBased on Value00	20180401As per Company/Group		18% Net Amt GST (Exp) 1033																																																			
-1																		667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-00000125	?																			Regular				Purchase Accounts						667653ae-9a3a-48fa-94ee-ee5e6c0c80b8											 Applicable		 Not Applicable	Others														 Not Applicable													 Not Applicable		 Not Applicable									Services							 Not Applicable								 Not Applicable							 Not Applicable									 Not Applicable													 Not Applicable									 Not Applicable																																							 Applicable																No	Yes	No	No	No		No	No					No	No	Yes		No			No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No		Yes					No				No	No	No	No	No		No	No	No	No	No		No	No	No						No													No																					0	0	0	 1000	 979	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00							000000000	000000000					20180401As per Company/GroupYes0 AnyCGSTBased on Value00SGST/UTGSTBased on Value00IGSTBased on Value00Cess Not Applicable00State CessBased on Value00	20180401As per Company/Group		18% Net Amt IGST 1033																																																			
-1																		667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-0000011d	?																			Regular				Purchase Accounts						667653ae-9a3a-48fa-94ee-ee5e6c0c80b8											 Applicable		 Not Applicable	Others														 Not Applicable													 Not Applicable		 Not Applicable									Goods							 Not Applicable								 Not Applicable							 Not Applicable									 Not Applicable													 Not Applicable									 Not Applicable																																							 Applicable																No	Yes	No	No	No		No	No					No	No	Yes		No			No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No		Yes					No				No	No	No	No	No		No	No	No	No	No		No	No	No						No													No																					0	0	0	 1000	 980	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00							000000000	000000000					20180401TaxableLocal Purchase - TaxableSpecify Details Here0 AnyCGSTBased on Value 90SGST/UTGSTBased on Value 90IGSTBased on Value 180Cess Not Applicable00State CessBased on Value00	20180401As per Company/Group		18% Net IGST (FA) 1033																																																			
-1																		667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000000d5	?																			Regular				Purchase Accounts						667653ae-9a3a-48fa-94ee-ee5e6c0c80b8											 Applicable		 Not Applicable	Others														 Not Applicable													 Not Applicable		 Not Applicable									Goods							 Not Applicable								 Not Applicable							 Not Applicable									 Not Applicable													 Not Applicable									 Not Applicable																																							 Applicable																No	Yes	No	No	No		No	No					No	No	Yes		No			No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No		Yes					No				No	No	No	No	No		No	No	No	No	No		No	No	No						No													No																					0	0	0	 1000	 981	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00							000000000	000000000					20180401TaxableLocal Purchase - TaxableSpecify Details Here0 AnyCGSTBased on Value 140SGST/UTGSTBased on Value 140IGSTBased on Value 280Cess Not Applicable00State CessBased on Value00	20180401As per Company/Group		28% Net Amt GST 1033																																																			
-1																		667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000000c1	?																							Duties & Taxes						667653ae-9a3a-48fa-94ee-ee5e6c0c80b8													 Not Applicable	GST														 Not Applicable													 Not Applicable		 Not Applicable							CGST		Services							 Not Applicable					 Not Applicable			 Not Applicable							 Not Applicable									 Not Applicable													 Not Applicable									 Not Applicable																																																							No	No	No	No	No		No	No					No	No	No		No			No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No		Yes					No				No	No	No	No	No		No	No	No	No	No		No	No	No						No													No																					0	0	0	 1000	 982	0	0	 6	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00							000000000	000000000								6% CSGT Amt (Exp) 1033																																																			
-1																		667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000000c2	?																							Duties & Taxes						667653ae-9a3a-48fa-94ee-ee5e6c0c80b8													 Not Applicable	GST																											 Not Applicable		 Not Applicable							SGST/UTGST		Services							 Not Applicable					 Not Applicable			 Not Applicable							 Not Applicable									 Not Applicable													 Not Applicable									 Not Applicable																																																							No	No	No	No	No		No	No					No	No	No		No			No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No		Yes					No				No	No	No	No	No		No	No	No	No	No		No	No	No						No													No																					0	0	0	 1000	 983	0	0	 6	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00							000000000	000000000								6% SGST Amt (Exp) 1033																																																			
-1																		667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-00000122	?																							Duties & Taxes						667653ae-9a3a-48fa-94ee-ee5e6c0c80b8													 Not Applicable	GST														 Not Applicable													 Not Applicable		 Not Applicable							CGST		Services							 Not Applicable					 Not Applicable			 Not Applicable							 Not Applicable									 Not Applicable													 Not Applicable									 Not Applicable																																																							No	No	No	No	No		No	No					No	No	No		No			No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No		Yes					No				No	No	No	No	No		No	No	No	No	No		No	No	No						No													No																					0	0	0	 1000	 984	0	0	 9	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00							000000000	000000000								9% CGST (Exp) 1033																																																			
-1																		667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-00000123	?																							Duties & Taxes						667653ae-9a3a-48fa-94ee-ee5e6c0c80b8													 Not Applicable	GST																											 Not Applicable		 Not Applicable							SGST/UTGST		Services							 Not Applicable					 Not Applicable			 Not Applicable							 Not Applicable									 Not Applicable													 Not Applicable									 Not Applicable																																																							No	No	No	No	No		No	No					No	No	No		No			No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No		Yes					No				No	No	No	No	No		No	No	No	No	No		No	No	No						No													No																					0	0	0	 1000	 985	0	0	 9	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00							000000000	000000000								9% SGST (Exp) 1033																																																			
-1																		667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000000eb	?																							Purchase Accounts						667653ae-9a3a-48fa-94ee-ee5e6c0c80b8											 Not Applicable		 Not Applicable	Others														 Not Applicable													 Not Applicable		 Not Applicable																 Not Applicable								 Not Applicable							 Not Applicable									 Not Applicable													 Not Applicable									 Not Applicable																																							 Applicable																No	Yes	No	No	No		No	No					No	No	Yes		No			No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No		Yes					No				No	No	No	No	No		No	No	No	No	No		No	No	No						No													No																					0	0	0	 1000	 986	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00							000000000	000000000								Abdul Qadir Zahoor Shaikh 1033																																																			
-1																		667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000000e5	?																							Indirect Expenses						667653ae-9a3a-48fa-94ee-ee5e6c0c80b8											 Not Applicable		 Not Applicable	Others														 Not Applicable													 Not Applicable		 Not Applicable																 Not Applicable								 Not Applicable							 Not Applicable									 Not Applicable													 Not Applicable									 Not Applicable																																							 Not Applicable																No	Yes	No	No	No		No	No					No	No	No		No			No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No		Yes					No				No	No	No	No	No		No	No	No	No	No		No	No	No						No													No																					0	0	0	 1000	 987	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00							000000000	000000000								Accounting Charges 1033																																																			
-1																		667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-0000011a	?																							Provisions						667653ae-9a3a-48fa-94ee-ee5e6c0c80b8											 Applicable		 Not Applicable	Others														 Not Applicable													 Not Applicable		 Not Applicable									Services							 Not Applicable								 Not Applicable							 Not Applicable									 Not Applicable													 Not Applicable									 Not Applicable																																																							No	No	No	No	No		No	No					No	No	No		No			No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No		Yes					No				No	No	No	No	No		No	No	No	No	No		No	No	No						No													No																					0	0	0	 1000	 988	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	17700.00							000000000	000000000					20180401As per Company/GroupYes0 AnyCGSTBased on Value00SGST/UTGSTBased on Value00IGSTBased on Value00Cess Not Applicable00State CessBased on Value00	20180401As per Company/Group		Aduit Fess Payable 1033																																																			
\.


--
-- TOC entry 3381 (class 0 OID 33014)
-- Dependencies: 214
-- Data for Name: query_cache; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.query_cache (id, user_id, prompt, full_prompt, db_schema, generated_sql, sql_result, summary, prompt_hash, executed_at, affected_tables, created_at, updated_at) FROM stdin;
eda27779-c14d-4b1a-a070-36c02dc1a550	user_2	What was our total Purchase in 2019	User query: What was our total Purchase in 2019\n\nSchema:\nTable: company\n  - deactivateexcisefrom: text\n  - deactivateservicetaxfrom: text\n  - name: text\n  - isservicetaxon: text\n  - isexcisemfgrtraderon: text\n  - isgston: text\n  - numexcisetaxunit: text\n  - numsttaxunit: text\n  - numgsttaxunit: text\n  - numexciseandsttaxunit: text\n  - numemptyusedfortaxunit: text\n\nTable: stockitem\n  - oldauditentryidslist: text\n  - activefrom: text\n  - activeto: text\n  - priceleveldate: text\n  - guid: text\n  - pricelevel: text\n  - parent: text\n  - category: text\n  - narration: text\n  - remoteguid: text\n  - remotealtguid: text\n  - enteredby: text\n  - alteredby: text\n  - typeofupdateactivity: text\n  - objectupdateaction: text\n  - tdsapplicable: text\n  - tcsapplicable: text\n  - gstapplicable: text\n  - taxclassificationname: text\n  - description: text\n  - gsttypeofsupply: text\n  - servicetaxapplicable: text\n  - exciseapplicability: text\n  - salestaxcessapplicable: text\n  - vatapplicable: text\n  - ledgername: text\n  - costingmethod: text\n  - valuationmethod: text\n  - baseunits: text\n  - additionalunits: text\n  - excisetaxtype: text\n  - natureofitem: text\n  - exciseitemclassification: text\n  - oldbasictarifftype: text\n  - tcscategory: text\n  - basictarifftype: text\n  - vatcommodity: text\n  - entrytaxcommodity: text\n  - vatbaseunit: text\n  - vattrailunit: text\n  - vatschdlentrtyno: text\n  - reorderperiod: text\n  - reorderroundtype: text\n  - minorderperiod: text\n  - minorderroundtype: text\n  - gstrepuom: text\n  - gstconvunit: text\n  - iscostcentreson: text\n  - isbatchwiseon: text\n  - isperishableon: text\n  - isentrytaxapplicable: text\n  - iscosttrackingon: text\n  - ismstfromsync: text\n  - isupdatingtargetid: text\n  - isdeleted: text\n  - issecurityonwhenentered: text\n  - asoriginal: text\n  - israteinclusivevat: text\n  - ignorephysicaldifference: text\n  - ignorenegativestock: text\n  - treatsalesasmanufactured: text\n  - treatpurchasesasconsumed: text\n  - treatrejectsasscrap: text\n  - hasmfgdate: text\n  - allowuseofexpireditems: text\n  - ignorebatches: text\n  - ignoregodowns: text\n  - adjdiffinfirstsaleledger: text\n  - adjdiffinfirstpurcledger: text\n  - calconmrp: text\n  - excludejrnlforvaluation: text\n  - ismrpincloftax: text\n  - isaddltaxexempt: text\n  - issupplementrydutyon: text\n  - gvatisexciseappl: text\n  - isadditionaltax: text\n  - iscessexempted: text\n  - reorderashigher: text\n  - minorderashigher: text\n  - isexcisecalculateonmrp: text\n  - inclusivetax: text\n  - gstcalcslabonmrp: text\n  - modifymrprate: text\n  - errkey: text\n  - alterid: text\n  - remotealterid: text\n  - denominator: text\n  - conversion: text\n  - rateofmrp: text\n  - basicrateofexcise: text\n  - rateofentrytax: text\n  - rateofvat: text\n  - rateofsat: text\n  - vatbaseno: text\n  - vattrailno: text\n  - vatactualratio: text\n  - reorderperiodlength: text\n  - reorderroundlimit: text\n  - minorderperiodlength: text\n  - minorderroundlimit: text\n  - gstitemunits: text\n  - gstrepunits: text\n  - openingbalance: text\n  - openingvalue: text\n  - basicvalue: text\n  - basicqty: text\n  - reorderbase: text\n  - minimumorderbase: text\n  - openingrate: text\n  - updateddatetime: text\n  - servicetaxdetailslist: text\n  - vatdetailslist: text\n  - salestaxcessdetailslist: text\n  - gstdetailslist: text\n  - hsndetailslist: text\n  - languagenamelist: text\n  - schvidetailslist: text\n  - excisetariffdetailslist: text\n  - tcscategorydetailslist: text\n  - tdscategorydetailslist: text\n  - excludedtaxationslist: text\n  - oldauditentrieslist: text\n  - accountauditentrieslist: text\n  - auditentrieslist: text\n  - oldmrpdetailslist: text\n  - vatclassificationdetailslist: text\n  - mrpdetailslist: text\n  - reportinguomdetailslist: text\n  - componentlistlist: text\n  - additionalledgerslist: text\n  - saleslistlist: text\n  - purchaselistlist: text\n  - fullpricelistlist: text\n  - batchallocationslist: text\n  - traderexcisedutieslist: text\n  - standardcostlistlist: text\n  - standardpricelistlist: text\n  - exciseitemgodownlist: text\n  - multicomponentlistlist: text\n  - lbtdetailslist: text\n  - pricelevellistlist: text\n\nTable: voucherledgerentries\n  - guid: text\n  - taxclassificationname: text\n  - appropriatefor: text\n  - ledgername: text\n  - statnaturename: text\n  - statclassificationname: text\n  - exciseclassificationname: text\n  - iszrbasicservice: text\n  - vatcommodityname: text\n  - schedule: text\n  - scheduleserialnumber: text\n  - vatcommoditycode: text\n  - tdspartyname: text\n  - vatpartyorgname: text\n  - vatcalculationtype: text\n  - vatworkscontracttype: text\n  - vatwcdescription: text\n  - gstclass: text\n  - gstovrdnclassification: text\n  - gstovrdnnature: text\n  - gstovrdnineligibleitc: text\n  - gstovrdnisrevchargeappl: text\n  - gstovrdntaxability: text\n  - gsthsnsaccode: text\n  - gstovrdnstorednature: text\n  - gsthsnname: text\n  - gsthsndescription: text\n  - isdeemedpositive: text\n  - ledgerfromitem: text\n  - ispartyledger: text\n  - islastdeemedpositive: text\n  - iscapvatnotclaimed: text\n  - rateofaddlvat: text\n  - rateofcessonvat: text\n  - vattaxrate: text\n  - vatitemqty: text\n  - vatwcdeductrate: text\n  - vatwcdeductionrate: text\n  - gsttaxrate: text\n  - amount: text\n  - crdr: text\n  - cessassvalonclass: text\n  - addnlvatclassamt: text\n  - vatassessablevalue: text\n  - vatwccostofland: text\n  - vatwcdedlabourcharges: text\n  - vatwcotherdeductionamt: text\n  - vatwcvalueoftaxfreegoods: text\n  - vatwcothercharges: text\n  - vatwcsubcontractoramt: text\n  - vatwcdeductamt: text\n  - wctotaldeductionamt: text\n  - vatwcdeductionamount: text\n  - originvgoodsvalue: text\n  - cenvatcaptinputamt: text\n  - gstassessablevalue: text\n  - igstliability: text\n  - cgstliability: text\n  - sgstliability: text\n  - gstcessliability: text\n  - gstovrdnassessablevalue: text\n  - gstassblvalue: text\n  - vatexpamount: text\n\nTable: vouchers\n  - date: text\n  - guid: text\n  - requestorrule: text\n  - vouchertypename: text\n  - vouchernumber: text\n  - serialmaster: text\n  - areserialmaster: text\n  - numberingstyle: text\n  - persistedview: text\n  - isdeleted: text\n  - asoriginal: text\n  - isdeemedpositive: text\n  - isinvoice: text\n  - aspayslip: text\n  - isdeletedvchretained: text\n  - isnegisposset: text\n  - masterid: text\n  - voucherkey: text\n  - voucherretainkey: text\n  - reuseholeid: text\n  - totalamount: text\n  - crdr: text\n  - vouchernumberseries: text\n\nTable: ledgergroups\n  - samplingdateonefactor: text\n  - samplingdatetwofactor: text\n  - activefrom: text\n  - activeto: text\n  - guid: text\n  - parent: text\n  - samplingmethod: text\n  - samplingstronefactor: text\n  - narration: text\n  - enteredby: text\n  - alteredby: text\n  - typeofupdateactivity: text\n  - objectupdateaction: text\n  - requestorrule: text\n  - basicgroupiscalculable: text\n  - addlalloctype: text\n  - grpdebitparent: text\n  - grpcreditparent: text\n  - sysdebitparent: text\n  - syscreditparent: text\n  - balancingtype: text\n  - tdsapplicable: text\n  - tcsapplicable: text\n  - gstapplicable: text\n  - isbillwiseon: text\n  - iscostcentreson: text\n  - isaddable: text\n  - isupdatingtargetid: text\n  - isdeleted: text\n  - issecurityonwhenentered: text\n  - asoriginal: text\n  - issubledger: text\n  - isrevenue: text\n  - affectsgrossprofit: text\n  - isdeemedpositive: text\n  - tracknegativebalances: text\n  - iscondensed: text\n  - affectsstock: text\n  - isgroupforloanrcpt: text\n  - isgroupforloanpymnt: text\n  - israteinclusivevat: text\n  - isinvdetailsenable: text\n  - samplingnumonefactor: text\n  - samplingnumtwofactor: text\n  - errkey: text\n  - sortposition: text\n  - alterid: text\n  - samplingamtonefactor: text\n  - samplingamttwofactor: text\n  - updateddatetime: text\n  - tempgstcgstrate: text\n  - tempgstsgstrate: text\n  - tempgstigstrate: text\n  - tempgstcessrate: text\n  - tempgstcessqtyrate: text\n  - tempgststatecessrate: text\n  - tempapplicablefrom: text\n  - tempisreversechargeappl: text\n  - tempgsteligibleitc: text\n  - tempgstinclexpforslabtax: text\n  - tempgstcalcslabonmrp: text\n  - tempgstclassification: text\n  - tempgsttaxablility: text\n  - tempgstnatureoftransaction: text\n  - tempsrcofgstdetails: text\n  - tempgsttaxrate: text\n  - tempgstcessvaltype: text\n  - tempgstslabcessvaltype: text\n  - tempgstslabcessrate: text\n  - tempgstslabcessqtyrate: text\n  - tempgstslabstatecessrate: text\n  - tempgsthsnapplfrom: text\n  - tempsrcofhsndetails: text\n  - tempgsthsnclassification: text\n  - tempgsthsncode: text\n  - tempgsthsndescription: text\n  - tempgsttaxablilitygstclassif: text\n  - tempgstnatureoftransactiongstclassif: text\n  - tempgstigstrategstclassif: text\n  - tempgstcgstrategstclassif: text\n  - tempgstsgstrategstclassif: text\n  - tempgstcessvaltypegstclassif: text\n  - tempgstcessqtyrategstclassif: text\n  - tempgststatecessrategstclassif: text\n  - tempisreversechargeapplgstclassif: text\n  - tempgsteligibleitcgstclassif: text\n  - tempgstcessrategstclassif: text\n  - tempgsthsncodegstclassif: text\n  - tempgsthsndescriptiongstclassif: text\n  - tempgroupnature: text\n  - tempaffectsgp: text\n  - temptaxtype: text\n  - tempisvatfieldsedited: text\n  - tempappldate: text\n  - tempclassification: text\n  - tempnature: text\n  - temppartyentity: text\n  - tempbusinessnature: text\n  - tempvatrate: text\n  - tempaddltax: text\n  - tempcessonvat: text\n  - tempmajorcommodityname: text\n  - tempcommodityname: text\n  - tempcommoditycode: text\n  - tempsubcommoditycode: text\n  - tempuom: text\n  - temptypeofgoods: text\n  - temptradename: text\n  - tempgoodsnature: text\n  - tempschedule: text\n  - tempscheduleslno: text\n  - tempisinvdetailsenable: text\n  - templocalvatrate: text\n  - tempvaluationtype: text\n  - tempiscalconqty: text\n  - servicetaxdetailslist: text\n  - vatdetailslist: text\n  - salestaxcessdetailslist: text\n  - gstdetailslist: text\n  - hsndetailslist: text\n  - languagenamelist: text\n  - xbrldetaillist: text\n  - auditdetailslist: text\n  - schvidetailslist: text\n  - excisetariffdetailslist: text\n  - tcscategorydetailslist: text\n  - tdscategorydetailslist: text\n  - tempgstitemslabrateslist: text\n  - gstclassfnigstrateslist: text\n  - extariffdutyheaddetailslist: text\n\nTable: ledgers\n  - oldauditentryidslist: text\n  - startingfrom: text\n  - stregdate: text\n  - lbtregndate: text\n  - vatregistrationdate: text\n  - cstregistrationdate: text\n  - samplingdateonefactor: text\n  - samplingdatetwofactor: text\n  - activefrom: text\n  - activeto: text\n  - createddate: text\n  - alteredon: text\n  - vatapplicabledate: text\n  - exciseregistrationdate: text\n  - panapplicablefrom: text\n  - payinsrunningfiledate: text\n  - vattaxexemptiondate: text\n  - banklastimportstmtdate: text\n  - guid: text\n  - currencyname: text\n  - email: text\n  - priorstatename: text\n  - website: text\n  - incometaxnumber: text\n  - salestaxnumber: text\n  - interstatestnumber: text\n  - vattinnumber: text\n  - exciserange: text\n  - excisedivision: text\n  - excisecommissionerate: text\n  - lbtregnno: text\n  - lbtzone: text\n  - exportimportcode: text\n  - branchname: text\n  - interstateoldstnumber: text\n  - vatoldtinnumber: text\n  - vatdistrictname: text\n  - gstregistrationtype: text\n  - vatdealertype: text\n  - statename: text\n  - pricelevel: text\n  - uploadlastrefresh: text\n  - parent: text\n  - samplingmethod: text\n  - samplingstronefactor: text\n  - ifscode: text\n  - narration: text\n  - remoteguid: text\n  - remotealtguid: text\n  - enteredby: text\n  - alteredby: text\n  - typeofupdateactivity: text\n  - objectupdateaction: text\n  - grpdebitparent: text\n  - grpcreditparent: text\n  - sysdebitparent: text\n  - syscreditparent: text\n  - tdsapplicable: text\n  - tcsapplicable: text\n  - gstapplicable: text\n  - createdby: text\n  - taxclassificationname: text\n  - taxtype: text\n  - billcreditperiod: text\n  - bankdetails: text\n  - bankbsrcode: text\n  - deducteetype: text\n  - businesstype: text\n  - typeofnotification: text\n  - msmeregnumber: text\n  - countryofresidence: text\n  - relatedpartyid: text\n  - relpartyissuingauthority: text\n  - importerexportercode: text\n  - emailcc: text\n  - description: text\n  - ledaddlalloctype: text\n  - transporterid: text\n  - oldpincode: text\n  - ledgerphone: text\n  - ledgerfax: text\n  - ledgercontact: text\n  - ledgermobile: text\n  - relationtype: text\n  - ledgercountryisdcode: text\n  - mailingnamenative: text\n  - statenamenative: text\n  - countrynamenative: text\n  - basictypeofduty: text\n  - gsttype: text\n  - exemptiontype: text\n  - appropriatefor: text\n  - subtaxtype: text\n  - stxnatureofparty: text\n  - nameonpan: text\n  - usedfortaxtype: text\n  - ecommmerchantid: text\n  - partygstin: text\n  - gstdutyhead: text\n  - gstappropriateto: text\n  - gsttypeofsupply: text\n  - gstnatureofsupply: text\n  - cessvaluationmethod: text\n  - partyoldgstin: text\n  - oldledstatename: text\n  - philippinesledvatclass: text\n  - vatdealernature: text\n  - paytype: text\n  - payslipname: text\n  - attendancetype: text\n  - leavetype: text\n  - calculationperiod: text\n  - roundingmethod: text\n  - computationtype: text\n  - calculationtype: text\n  - paystattype: text\n  - professionaltaxnumber: text\n  - userdefinedcalendertype: text\n  - itnature: text\n  - itcomponent: text\n  - notificationnumber: text\n  - registrationnumber: text\n  - servicecategory: text\n  - abatementnotificationno: text\n  - stxdutyhead: text\n  - stxclassification: text\n  - notificationslno: text\n  - servicetaxapplicable: text\n  - exciseledgerclassification: text\n  - exciseregistrationnumber: text\n  - exciseaccounthead: text\n  - excisedutytype: text\n  - excisedutyheadcode: text\n  - excisealloctype: text\n  - excisedutyhead: text\n  - natureofsales: text\n  - excisenotificationno: text\n  - exciseimportsregistartionno: text\n  - exciseapplicability: text\n  - excisetypeofbranch: text\n  - excisedefaultremoval: text\n  - excisenotificationslno: text\n  - typeoftariff: text\n  - exciseregno: text\n  - excisenatureofpurchase: text\n  - tdsdeducteetypemst: text\n  - tdsratename: text\n  - tdsdeducteesectionnumber: text\n  - panstatus: text\n  - deducteereference: text\n  - tdsdeducteetype: text\n  - itexemptapplicable: text\n  - taxidentificationno: text\n  - ledgerfbtcategory: text\n  - branchcode: text\n  - clientcode: text\n  - bankingconfigbank: text\n  - bankingconfigbankid: text\n  - bankaccholdername: text\n  - useforpostype: text\n  - paymentgateway: text\n  - typeofintereston: text\n  - bankconfigifsc: text\n  - bankconfigmicr: text\n  - bankconfigshortcode: text\n  - pymtinstoutputname: text\n  - productcodetype: text\n  - salarypymtproductcode: text\n  - otherpymtproductcode: text\n  - paymentinstlocation: text\n  - encrptionlocation: text\n  - newimflocation: text\n  - importedimflocation: text\n  - banknewstatements: text\n  - bankimportedstatements: text\n  - bankmicr: text\n  - corporateusernoecs: text\n  - corporateusernoach: text\n  - corporateusername: text\n  - imfname: text\n  - payinsbatchname: text\n  - lastusedbatchname: text\n  - payinsfilenumperiod: text\n  - encryptedby: text\n  - encryptedid: text\n  - isocurrencycode: text\n  - bankcapsuleid: text\n  - salestaxcessapplicable: text\n  - bankiban: text\n  - vattaxexemptionnature: text\n  - vattaxexemptionnumber: text\n  - oldcountryname: text\n  - vatapplicable: text\n  - partybusinesstype: text\n  - partybusinessstyle: text\n  - swiftcode: text\n  - ebankingformat: text\n  - virtualpaymentaddress: text\n  - banklastfetchstmtformat: text\n  - defaulttransfermode: text\n  - defaultwithdrawvchtype: text\n  - defaultdepositvchtype: text\n  - defaultcontravchtype: text\n  - banklastfetchbalacctnum: text\n  - bankperfectmatchconfig: text\n  - defaultnumseriesdeposit: text\n  - defaultnumserieswithdrawl: text\n  - defaultnumseriesinternaltransfer: text\n  - isbillwiseon: text\n  - iscostcentreson: text\n  - isintereston: text\n  - allowinmobile: text\n  - iscosttrackingon: text\n  - isbeneficiarycodeon: text\n  - isexportonvchcreate: text\n  - plasincomeexpense: text\n  - ismstfromsync: text\n  - isupdatingtargetid: text\n  - isdeleted: text\n  - issecurityonwhenentered: text\n  - asoriginal: text\n  - iscondensed: text\n  - affectsstock: text\n  - israteinclusivevat: text\n  - forpayroll: text\n  - isabcenabled: text\n  - iscreditdayschkon: text\n  - interestonbillwise: text\n  - overrideinterest: text\n  - overrideadvinterest: text\n  - useforvat: text\n  - ignoretdsexempt: text\n  - istcsapplicable: text\n  - istdsapplicable: text\n  - isfbtapplicable: text\n  - isgstapplicable: text\n  - isexciseapplicable: text\n  - istdsexpense: text\n  - isedliapplicable: text\n  - isrelatedparty: text\n  - useforesieligibility: text\n  - isinterestincllastday: text\n  - appropriatetaxvalue: text\n  - isbehaveasduty: text\n  - interestincldayofaddition: text\n  - interestincldayofdeduction: text\n  - isothterritoryassessee: text\n  - ignoremismatchwithwarning: text\n  - useasnotionalbank: text\n  - behaveaspaymentgateway: text\n  - overridecreditlimit: text\n  - isagainstformc: text\n  - ischequeprintingenabled: text\n  - ispayupload: text\n  - ispaybatchonlysal: text\n  - isbnfcodesupported: text\n  - allowexportwitherrors: text\n  - considerpurchaseforexport: text\n  - istransporter: text\n  - isecashledger: text\n  - usefornotionalitc: text\n  - isecommoperator: text\n  - overridebasedonrealization: text\n  - isecdiffinsdate: text\n  - showinpayslip: text\n  - useforgratuity: text\n  - istdsprojected: text\n  - issalarymulfile: text\n  - forservicetax: text\n  - isinputcredit: text\n  - isexempted: text\n  - isabatementapplicable: text\n  - isstxparty: text\n  - isstxnonrealizedtype: text\n  - useforkkc: text\n  - useforsbc: text\n  - isusedforcvd: text\n  - ledbelongstonontaxable: text\n  - isexcisemerchantexporter: text\n  - ispartyexempted: text\n  - issezparty: text\n  - tdsdeducteeisspecialrate: text\n  - isechequesupported: text\n  - iseddsupported: text\n  - hasechequedeliverymode: text\n  - hasechequedeliveryto: text\n  - hasechequeprintlocation: text\n  - hasechequepayablelocation: text\n  - hasechequebanklocation: text\n  - hasedddeliverymode: text\n  - hasedddeliveryto: text\n  - haseddprintlocation: text\n  - haseddpayablelocation: text\n  - haseddbanklocation: text\n  - isebankingenabled: text\n  - isexportfileencrypted: text\n  - isbatchenabled: text\n  - isproductcodebased: text\n  - haseddcity: text\n  - hasechequecity: text\n  - isfilenameformatsupported: text\n  - hasclientcode: text\n  - payinsisbatchapplicable: text\n  - payinsisfilenumapp: text\n  - issalarytransgroupedforbrs: text\n  - isebankingsupported: text\n  - isscbuae: text\n  - isbankstatusapp: text\n  - issalarygrouped: text\n  - useforpurchasetax: text\n  - bankisreconcileperfectmatches: text\n  - ispymtadvonline: text\n  - ispymtadvccenabled: text\n  - isincludepymtadvbillwise: text\n  - audited: text\n  - samplingnumonefactor: text\n  - samplingnumtwofactor: text\n  - errkey: text\n  - sortposition: text\n  - alterid: text\n  - remotealterid: text\n  - defaultlanguage: text\n  - rateoftaxcalculation: text\n  - gratuitymonthdays: text\n  - gratuitylimitmonths: text\n  - calculationbasis: text\n  - roundinglimit: text\n  - abatementpercentage: text\n  - tdsdeducteespecialrate: text\n  - beneficiarycodemaxlength: text\n  - echequeprintlocationversion: text\n  - echequepayablelocationversion: text\n  - eddprintlocationversion: text\n  - eddpayablelocationversion: text\n  - payinsrunningfilenum: text\n  - transactiontypeversion: text\n  - payinsfilenumlength: text\n  - openingbalance: text\n  - samplingamtonefactor: text\n  - samplingamttwofactor: text\n  - creditlimit: text\n  - gratuitylimitamount: text\n  - odlimit: text\n  - banklastfetchbalance: text\n  - updateddatetime: text\n  - banklastfetchbalancedatetime: text\n  - servicetaxdetailslist: text\n  - lbtregndetailslist: text\n  - vatdetailslist: text\n  - salestaxcessdetailslist: text\n  - gstdetailslist: text\n  - hsndetailslist: text\n  - msmeregistrationdetailslist: text\n  - languagenamelist: text\n  - xbrldetaillist: text\n  - auditdetailslist: text\n  - schvidetailslist: text\n  - excisetariffdetailslist: text\n  - tcscategorydetailslist: text\n  - tdscategorydetailslist: text\n  - slabperiodlist: text\n  - gratuityperiodlist: text\n  - additionalcomputationslist: text\n  - excisejurisdictiondetailslist: text\n  - excludedtaxationslist: text\n  - bankallocationslist: text\n  - paymentdetailslist: text\n  - bankexportformatslist: text\n  - transfermodelimitdetailslist: text\n  - bankledgerbalancedetailslist: text\n  - billallocationslist: text\n  - interestcollectionlist: text\n  - ledgerclosingvalueslist: text\n  - ledgerauditclasslist: text\n  - oldauditentrieslist: text\n  - tdsexemptionruleslist: text\n  - deductinsamevchruleslist: text\n  - lowerdeductionlist: text\n  - stxabatementdetailslist: text\n  - ledmultiaddresslistlist: text\n  - stxtaxdetailslist: text\n  - chequerangelist: text\n  - defaultvchchequedetailslist: text\n  - accountauditentrieslist: text\n  - auditentrieslist: text\n  - brsimportedinfolist: text\n  - autobrsconfigslist: text\n  - bankurentrieslist: text\n  - defaultchequedetailslist: text\n  - defaultopeningchequedetailslist: text\n  - cancelledpayallocationslist: text\n  - echequeprintlocationlist: text\n  - echequepayablelocationlist: text\n  - eddprintlocationlist: text\n  - eddpayablelocationlist: text\n  - availabletransactiontypeslist: text\n  - ledpayinsconfigslist: text\n  - typecodedetailslist: text\n  - fieldvalidationdetailslist: text\n  - inputcrallocslist: text\n  - tcsmethodofcalculationlist: text\n  - ledgstregdetailslist: text\n  - ledmailingdetailslist: text\n  - gstreconprefixsuffixdetailslist: text\n  - contactdetailslist: text\n\nTable: query_cache\n  - updated_at: timestamp without time zone\n  - sql_result: json\n  - executed_at: timestamp with time zone\n  - created_at: timestamp without time zone\n  - id: uuid\n  - generated_sql: text\n  - affected_tables: ARRAY\n  - summary: text\n  - prompt_hash: character varying\n  - user_id: character varying\n  - prompt: text\n  - full_prompt: text\n  - db_schema: text\n\n\nOnly use the following tables and columns:\n- company: deactivateexcisefrom, deactivateservicetaxfrom, name, isservicetaxon, isexcisemfgrtraderon, isgston, numexcisetaxunit, numsttaxunit, numgsttaxunit, numexciseandsttaxunit, numemptyusedfortaxunit\n- stockitem: oldauditentryidslist, activefrom, activeto, priceleveldate, guid, pricelevel, parent, category, narration, remoteguid, remotealtguid, enteredby, alteredby, typeofupdateactivity, objectupdateaction, tdsapplicable, tcsapplicable, gstapplicable, taxclassificationname, description, gsttypeofsupply, servicetaxapplicable, exciseapplicability, salestaxcessapplicable, vatapplicable, ledgername, costingmethod, valuationmethod, baseunits, additionalunits, excisetaxtype, natureofitem, exciseitemclassification, oldbasictarifftype, tcscategory, basictarifftype, vatcommodity, entrytaxcommodity, vatbaseunit, vattrailunit, vatschdlentrtyno, reorderperiod, reorderroundtype, minorderperiod, minorderroundtype, gstrepuom, gstconvunit, iscostcentreson, isbatchwiseon, isperishableon, isentrytaxapplicable, iscosttrackingon, ismstfromsync, isupdatingtargetid, isdeleted, issecurityonwhenentered, asoriginal, israteinclusivevat, ignorephysicaldifference, ignorenegativestock, treatsalesasmanufactured, treatpurchasesasconsumed, treatrejectsasscrap, hasmfgdate, allowuseofexpireditems, ignorebatches, ignoregodowns, adjdiffinfirstsaleledger, adjdiffinfirstpurcledger, calconmrp, excludejrnlforvaluation, ismrpincloftax, isaddltaxexempt, issupplementrydutyon, gvatisexciseappl, isadditionaltax, iscessexempted, reorderashigher, minorderashigher, isexcisecalculateonmrp, inclusivetax, gstcalcslabonmrp, modifymrprate, errkey, alterid, remotealterid, denominator, conversion, rateofmrp, basicrateofexcise, rateofentrytax, rateofvat, rateofsat, vatbaseno, vattrailno, vatactualratio, reorderperiodlength, reorderroundlimit, minorderperiodlength, minorderroundlimit, gstitemunits, gstrepunits, openingbalance, openingvalue, basicvalue, basicqty, reorderbase, minimumorderbase, openingrate, updateddatetime, servicetaxdetailslist, vatdetailslist, salestaxcessdetailslist, gstdetailslist, hsndetailslist, languagenamelist, schvidetailslist, excisetariffdetailslist, tcscategorydetailslist, tdscategorydetailslist, excludedtaxationslist, oldauditentrieslist, accountauditentrieslist, auditentrieslist, oldmrpdetailslist, vatclassificationdetailslist, mrpdetailslist, reportinguomdetailslist, componentlistlist, additionalledgerslist, saleslistlist, purchaselistlist, fullpricelistlist, batchallocationslist, traderexcisedutieslist, standardcostlistlist, standardpricelistlist, exciseitemgodownlist, multicomponentlistlist, lbtdetailslist, pricelevellistlist\n- voucherledgerentries: guid, taxclassificationname, appropriatefor, ledgername, statnaturename, statclassificationname, exciseclassificationname, iszrbasicservice, vatcommodityname, schedule, scheduleserialnumber, vatcommoditycode, tdspartyname, vatpartyorgname, vatcalculationtype, vatworkscontracttype, vatwcdescription, gstclass, gstovrdnclassification, gstovrdnnature, gstovrdnineligibleitc, gstovrdnisrevchargeappl, gstovrdntaxability, gsthsnsaccode, gstovrdnstorednature, gsthsnname, gsthsndescription, isdeemedpositive, ledgerfromitem, ispartyledger, islastdeemedpositive, iscapvatnotclaimed, rateofaddlvat, rateofcessonvat, vattaxrate, vatitemqty, vatwcdeductrate, vatwcdeductionrate, gsttaxrate, amount, crdr, cessassvalonclass, addnlvatclassamt, vatassessablevalue, vatwccostofland, vatwcdedlabourcharges, vatwcotherdeductionamt, vatwcvalueoftaxfreegoods, vatwcothercharges, vatwcsubcontractoramt, vatwcdeductamt, wctotaldeductionamt, vatwcdeductionamount, originvgoodsvalue, cenvatcaptinputamt, gstassessablevalue, igstliability, cgstliability, sgstliability, gstcessliability, gstovrdnassessablevalue, gstassblvalue, vatexpamount\n- vouchers: date, guid, requestorrule, vouchertypename, vouchernumber, serialmaster, areserialmaster, numberingstyle, persistedview, isdeleted, asoriginal, isdeemedpositive, isinvoice, aspayslip, isdeletedvchretained, isnegisposset, masterid, voucherkey, voucherretainkey, reuseholeid, totalamount, crdr, vouchernumberseries\n- ledgergroups: samplingdateonefactor, samplingdatetwofactor, activefrom, activeto, guid, parent, samplingmethod, samplingstronefactor, narration, enteredby, alteredby, typeofupdateactivity, objectupdateaction, requestorrule, basicgroupiscalculable, addlalloctype, grpdebitparent, grpcreditparent, sysdebitparent, syscreditparent, balancingtype, tdsapplicable, tcsapplicable, gstapplicable, isbillwiseon, iscostcentreson, isaddable, isupdatingtargetid, isdeleted, issecurityonwhenentered, asoriginal, issubledger, isrevenue, affectsgrossprofit, isdeemedpositive, tracknegativebalances, iscondensed, affectsstock, isgroupforloanrcpt, isgroupforloanpymnt, israteinclusivevat, isinvdetailsenable, samplingnumonefactor, samplingnumtwofactor, errkey, sortposition, alterid, samplingamtonefactor, samplingamttwofactor, updateddatetime, tempgstcgstrate, tempgstsgstrate, tempgstigstrate, tempgstcessrate, tempgstcessqtyrate, tempgststatecessrate, tempapplicablefrom, tempisreversechargeappl, tempgsteligibleitc, tempgstinclexpforslabtax, tempgstcalcslabonmrp, tempgstclassification, tempgsttaxablility, tempgstnatureoftransaction, tempsrcofgstdetails, tempgsttaxrate, tempgstcessvaltype, tempgstslabcessvaltype, tempgstslabcessrate, tempgstslabcessqtyrate, tempgstslabstatecessrate, tempgsthsnapplfrom, tempsrcofhsndetails, tempgsthsnclassification, tempgsthsncode, tempgsthsndescription, tempgsttaxablilitygstclassif, tempgstnatureoftransactiongstclassif, tempgstigstrategstclassif, tempgstcgstrategstclassif, tempgstsgstrategstclassif, tempgstcessvaltypegstclassif, tempgstcessqtyrategstclassif, tempgststatecessrategstclassif, tempisreversechargeapplgstclassif, tempgsteligibleitcgstclassif, tempgstcessrategstclassif, tempgsthsncodegstclassif, tempgsthsndescriptiongstclassif, tempgroupnature, tempaffectsgp, temptaxtype, tempisvatfieldsedited, tempappldate, tempclassification, tempnature, temppartyentity, tempbusinessnature, tempvatrate, tempaddltax, tempcessonvat, tempmajorcommodityname, tempcommodityname, tempcommoditycode, tempsubcommoditycode, tempuom, temptypeofgoods, temptradename, tempgoodsnature, tempschedule, tempscheduleslno, tempisinvdetailsenable, templocalvatrate, tempvaluationtype, tempiscalconqty, servicetaxdetailslist, vatdetailslist, salestaxcessdetailslist, gstdetailslist, hsndetailslist, languagenamelist, xbrldetaillist, auditdetailslist, schvidetailslist, excisetariffdetailslist, tcscategorydetailslist, tdscategorydetailslist, tempgstitemslabrateslist, gstclassfnigstrateslist, extariffdutyheaddetailslist\n- ledgers: oldauditentryidslist, startingfrom, stregdate, lbtregndate, vatregistrationdate, cstregistrationdate, samplingdateonefactor, samplingdatetwofactor, activefrom, activeto, createddate, alteredon, vatapplicabledate, exciseregistrationdate, panapplicablefrom, payinsrunningfiledate, vattaxexemptiondate, banklastimportstmtdate, guid, currencyname, email, priorstatename, website, incometaxnumber, salestaxnumber, interstatestnumber, vattinnumber, exciserange, excisedivision, excisecommissionerate, lbtregnno, lbtzone, exportimportcode, branchname, interstateoldstnumber, vatoldtinnumber, vatdistrictname, gstregistrationtype, vatdealertype, statename, pricelevel, uploadlastrefresh, parent, samplingmethod, samplingstronefactor, ifscode, narration, remoteguid, remotealtguid, enteredby, alteredby, typeofupdateactivity, objectupdateaction, grpdebitparent, grpcreditparent, sysdebitparent, syscreditparent, tdsapplicable, tcsapplicable, gstapplicable, createdby, taxclassificationname, taxtype, billcreditperiod, bankdetails, bankbsrcode, deducteetype, businesstype, typeofnotification, msmeregnumber, countryofresidence, relatedpartyid, relpartyissuingauthority, importerexportercode, emailcc, description, ledaddlalloctype, transporterid, oldpincode, ledgerphone, ledgerfax, ledgercontact, ledgermobile, relationtype, ledgercountryisdcode, mailingnamenative, statenamenative, countrynamenative, basictypeofduty, gsttype, exemptiontype, appropriatefor, subtaxtype, stxnatureofparty, nameonpan, usedfortaxtype, ecommmerchantid, partygstin, gstdutyhead, gstappropriateto, gsttypeofsupply, gstnatureofsupply, cessvaluationmethod, partyoldgstin, oldledstatename, philippinesledvatclass, vatdealernature, paytype, payslipname, attendancetype, leavetype, calculationperiod, roundingmethod, computationtype, calculationtype, paystattype, professionaltaxnumber, userdefinedcalendertype, itnature, itcomponent, notificationnumber, registrationnumber, servicecategory, abatementnotificationno, stxdutyhead, stxclassification, notificationslno, servicetaxapplicable, exciseledgerclassification, exciseregistrationnumber, exciseaccounthead, excisedutytype, excisedutyheadcode, excisealloctype, excisedutyhead, natureofsales, excisenotificationno, exciseimportsregistartionno, exciseapplicability, excisetypeofbranch, excisedefaultremoval, excisenotificationslno, typeoftariff, exciseregno, excisenatureofpurchase, tdsdeducteetypemst, tdsratename, tdsdeducteesectionnumber, panstatus, deducteereference, tdsdeducteetype, itexemptapplicable, taxidentificationno, ledgerfbtcategory, branchcode, clientcode, bankingconfigbank, bankingconfigbankid, bankaccholdername, useforpostype, paymentgateway, typeofintereston, bankconfigifsc, bankconfigmicr, bankconfigshortcode, pymtinstoutputname, productcodetype, salarypymtproductcode, otherpymtproductcode, paymentinstlocation, encrptionlocation, newimflocation, importedimflocation, banknewstatements, bankimportedstatements, bankmicr, corporateusernoecs, corporateusernoach, corporateusername, imfname, payinsbatchname, lastusedbatchname, payinsfilenumperiod, encryptedby, encryptedid, isocurrencycode, bankcapsuleid, salestaxcessapplicable, bankiban, vattaxexemptionnature, vattaxexemptionnumber, oldcountryname, vatapplicable, partybusinesstype, partybusinessstyle, swiftcode, ebankingformat, virtualpaymentaddress, banklastfetchstmtformat, defaulttransfermode, defaultwithdrawvchtype, defaultdepositvchtype, defaultcontravchtype, banklastfetchbalacctnum, bankperfectmatchconfig, defaultnumseriesdeposit, defaultnumserieswithdrawl, defaultnumseriesinternaltransfer, isbillwiseon, iscostcentreson, isintereston, allowinmobile, iscosttrackingon, isbeneficiarycodeon, isexportonvchcreate, plasincomeexpense, ismstfromsync, isupdatingtargetid, isdeleted, issecurityonwhenentered, asoriginal, iscondensed, affectsstock, israteinclusivevat, forpayroll, isabcenabled, iscreditdayschkon, interestonbillwise, overrideinterest, overrideadvinterest, useforvat, ignoretdsexempt, istcsapplicable, istdsapplicable, isfbtapplicable, isgstapplicable, isexciseapplicable, istdsexpense, isedliapplicable, isrelatedparty, useforesieligibility, isinterestincllastday, appropriatetaxvalue, isbehaveasduty, interestincldayofaddition, interestincldayofdeduction, isothterritoryassessee, ignoremismatchwithwarning, useasnotionalbank, behaveaspaymentgateway, overridecreditlimit, isagainstformc, ischequeprintingenabled, ispayupload, ispaybatchonlysal, isbnfcodesupported, allowexportwitherrors, considerpurchaseforexport, istransporter, isecashledger, usefornotionalitc, isecommoperator, overridebasedonrealization, isecdiffinsdate, showinpayslip, useforgratuity, istdsprojected, issalarymulfile, forservicetax, isinputcredit, isexempted, isabatementapplicable, isstxparty, isstxnonrealizedtype, useforkkc, useforsbc, isusedforcvd, ledbelongstonontaxable, isexcisemerchantexporter, ispartyexempted, issezparty, tdsdeducteeisspecialrate, isechequesupported, iseddsupported, hasechequedeliverymode, hasechequedeliveryto, hasechequeprintlocation, hasechequepayablelocation, hasechequebanklocation, hasedddeliverymode, hasedddeliveryto, haseddprintlocation, haseddpayablelocation, haseddbanklocation, isebankingenabled, isexportfileencrypted, isbatchenabled, isproductcodebased, haseddcity, hasechequecity, isfilenameformatsupported, hasclientcode, payinsisbatchapplicable, payinsisfilenumapp, issalarytransgroupedforbrs, isebankingsupported, isscbuae, isbankstatusapp, issalarygrouped, useforpurchasetax, bankisreconcileperfectmatches, ispymtadvonline, ispymtadvccenabled, isincludepymtadvbillwise, audited, samplingnumonefactor, samplingnumtwofactor, errkey, sortposition, alterid, remotealterid, defaultlanguage, rateoftaxcalculation, gratuitymonthdays, gratuitylimitmonths, calculationbasis, roundinglimit, abatementpercentage, tdsdeducteespecialrate, beneficiarycodemaxlength, echequeprintlocationversion, echequepayablelocationversion, eddprintlocationversion, eddpayablelocationversion, payinsrunningfilenum, transactiontypeversion, payinsfilenumlength, openingbalance, samplingamtonefactor, samplingamttwofactor, creditlimit, gratuitylimitamount, odlimit, banklastfetchbalance, updateddatetime, banklastfetchbalancedatetime, servicetaxdetailslist, lbtregndetailslist, vatdetailslist, salestaxcessdetailslist, gstdetailslist, hsndetailslist, msmeregistrationdetailslist, languagenamelist, xbrldetaillist, auditdetailslist, schvidetailslist, excisetariffdetailslist, tcscategorydetailslist, tdscategorydetailslist, slabperiodlist, gratuityperiodlist, additionalcomputationslist, excisejurisdictiondetailslist, excludedtaxationslist, bankallocationslist, paymentdetailslist, bankexportformatslist, transfermodelimitdetailslist, bankledgerbalancedetailslist, billallocationslist, interestcollectionlist, ledgerclosingvalueslist, ledgerauditclasslist, oldauditentrieslist, tdsexemptionruleslist, deductinsamevchruleslist, lowerdeductionlist, stxabatementdetailslist, ledmultiaddresslistlist, stxtaxdetailslist, chequerangelist, defaultvchchequedetailslist, accountauditentrieslist, auditentrieslist, brsimportedinfolist, autobrsconfigslist, bankurentrieslist, defaultchequedetailslist, defaultopeningchequedetailslist, cancelledpayallocationslist, echequeprintlocationlist, echequepayablelocationlist, eddprintlocationlist, eddpayablelocationlist, availabletransactiontypeslist, ledpayinsconfigslist, typecodedetailslist, fieldvalidationdetailslist, inputcrallocslist, tcsmethodofcalculationlist, ledgstregdetailslist, ledmailingdetailslist, gstreconprefixsuffixdetailslist, contactdetailslist\n- query_cache: updated_at, sql_result, executed_at, created_at, id, generated_sql, affected_tables, summary, prompt_hash, user_id, prompt, full_prompt, db_schema\n\nGenerate a syntactically correct SQL query using only the above.	Table: company\n  - deactivateexcisefrom: text\n  - deactivateservicetaxfrom: text\n  - name: text\n  - isservicetaxon: text\n  - isexcisemfgrtraderon: text\n  - isgston: text\n  - numexcisetaxunit: text\n  - numsttaxunit: text\n  - numgsttaxunit: text\n  - numexciseandsttaxunit: text\n  - numemptyusedfortaxunit: text\n\nTable: stockitem\n  - oldauditentryidslist: text\n  - activefrom: text\n  - activeto: text\n  - priceleveldate: text\n  - guid: text\n  - pricelevel: text\n  - parent: text\n  - category: text\n  - narration: text\n  - remoteguid: text\n  - remotealtguid: text\n  - enteredby: text\n  - alteredby: text\n  - typeofupdateactivity: text\n  - objectupdateaction: text\n  - tdsapplicable: text\n  - tcsapplicable: text\n  - gstapplicable: text\n  - taxclassificationname: text\n  - description: text\n  - gsttypeofsupply: text\n  - servicetaxapplicable: text\n  - exciseapplicability: text\n  - salestaxcessapplicable: text\n  - vatapplicable: text\n  - ledgername: text\n  - costingmethod: text\n  - valuationmethod: text\n  - baseunits: text\n  - additionalunits: text\n  - excisetaxtype: text\n  - natureofitem: text\n  - exciseitemclassification: text\n  - oldbasictarifftype: text\n  - tcscategory: text\n  - basictarifftype: text\n  - vatcommodity: text\n  - entrytaxcommodity: text\n  - vatbaseunit: text\n  - vattrailunit: text\n  - vatschdlentrtyno: text\n  - reorderperiod: text\n  - reorderroundtype: text\n  - minorderperiod: text\n  - minorderroundtype: text\n  - gstrepuom: text\n  - gstconvunit: text\n  - iscostcentreson: text\n  - isbatchwiseon: text\n  - isperishableon: text\n  - isentrytaxapplicable: text\n  - iscosttrackingon: text\n  - ismstfromsync: text\n  - isupdatingtargetid: text\n  - isdeleted: text\n  - issecurityonwhenentered: text\n  - asoriginal: text\n  - israteinclusivevat: text\n  - ignorephysicaldifference: text\n  - ignorenegativestock: text\n  - treatsalesasmanufactured: text\n  - treatpurchasesasconsumed: text\n  - treatrejectsasscrap: text\n  - hasmfgdate: text\n  - allowuseofexpireditems: text\n  - ignorebatches: text\n  - ignoregodowns: text\n  - adjdiffinfirstsaleledger: text\n  - adjdiffinfirstpurcledger: text\n  - calconmrp: text\n  - excludejrnlforvaluation: text\n  - ismrpincloftax: text\n  - isaddltaxexempt: text\n  - issupplementrydutyon: text\n  - gvatisexciseappl: text\n  - isadditionaltax: text\n  - iscessexempted: text\n  - reorderashigher: text\n  - minorderashigher: text\n  - isexcisecalculateonmrp: text\n  - inclusivetax: text\n  - gstcalcslabonmrp: text\n  - modifymrprate: text\n  - errkey: text\n  - alterid: text\n  - remotealterid: text\n  - denominator: text\n  - conversion: text\n  - rateofmrp: text\n  - basicrateofexcise: text\n  - rateofentrytax: text\n  - rateofvat: text\n  - rateofsat: text\n  - vatbaseno: text\n  - vattrailno: text\n  - vatactualratio: text\n  - reorderperiodlength: text\n  - reorderroundlimit: text\n  - minorderperiodlength: text\n  - minorderroundlimit: text\n  - gstitemunits: text\n  - gstrepunits: text\n  - openingbalance: text\n  - openingvalue: text\n  - basicvalue: text\n  - basicqty: text\n  - reorderbase: text\n  - minimumorderbase: text\n  - openingrate: text\n  - updateddatetime: text\n  - servicetaxdetailslist: text\n  - vatdetailslist: text\n  - salestaxcessdetailslist: text\n  - gstdetailslist: text\n  - hsndetailslist: text\n  - languagenamelist: text\n  - schvidetailslist: text\n  - excisetariffdetailslist: text\n  - tcscategorydetailslist: text\n  - tdscategorydetailslist: text\n  - excludedtaxationslist: text\n  - oldauditentrieslist: text\n  - accountauditentrieslist: text\n  - auditentrieslist: text\n  - oldmrpdetailslist: text\n  - vatclassificationdetailslist: text\n  - mrpdetailslist: text\n  - reportinguomdetailslist: text\n  - componentlistlist: text\n  - additionalledgerslist: text\n  - saleslistlist: text\n  - purchaselistlist: text\n  - fullpricelistlist: text\n  - batchallocationslist: text\n  - traderexcisedutieslist: text\n  - standardcostlistlist: text\n  - standardpricelistlist: text\n  - exciseitemgodownlist: text\n  - multicomponentlistlist: text\n  - lbtdetailslist: text\n  - pricelevellistlist: text\n\nTable: voucherledgerentries\n  - guid: text\n  - taxclassificationname: text\n  - appropriatefor: text\n  - ledgername: text\n  - statnaturename: text\n  - statclassificationname: text\n  - exciseclassificationname: text\n  - iszrbasicservice: text\n  - vatcommodityname: text\n  - schedule: text\n  - scheduleserialnumber: text\n  - vatcommoditycode: text\n  - tdspartyname: text\n  - vatpartyorgname: text\n  - vatcalculationtype: text\n  - vatworkscontracttype: text\n  - vatwcdescription: text\n  - gstclass: text\n  - gstovrdnclassification: text\n  - gstovrdnnature: text\n  - gstovrdnineligibleitc: text\n  - gstovrdnisrevchargeappl: text\n  - gstovrdntaxability: text\n  - gsthsnsaccode: text\n  - gstovrdnstorednature: text\n  - gsthsnname: text\n  - gsthsndescription: text\n  - isdeemedpositive: text\n  - ledgerfromitem: text\n  - ispartyledger: text\n  - islastdeemedpositive: text\n  - iscapvatnotclaimed: text\n  - rateofaddlvat: text\n  - rateofcessonvat: text\n  - vattaxrate: text\n  - vatitemqty: text\n  - vatwcdeductrate: text\n  - vatwcdeductionrate: text\n  - gsttaxrate: text\n  - amount: text\n  - crdr: text\n  - cessassvalonclass: text\n  - addnlvatclassamt: text\n  - vatassessablevalue: text\n  - vatwccostofland: text\n  - vatwcdedlabourcharges: text\n  - vatwcotherdeductionamt: text\n  - vatwcvalueoftaxfreegoods: text\n  - vatwcothercharges: text\n  - vatwcsubcontractoramt: text\n  - vatwcdeductamt: text\n  - wctotaldeductionamt: text\n  - vatwcdeductionamount: text\n  - originvgoodsvalue: text\n  - cenvatcaptinputamt: text\n  - gstassessablevalue: text\n  - igstliability: text\n  - cgstliability: text\n  - sgstliability: text\n  - gstcessliability: text\n  - gstovrdnassessablevalue: text\n  - gstassblvalue: text\n  - vatexpamount: text\n\nTable: vouchers\n  - date: text\n  - guid: text\n  - requestorrule: text\n  - vouchertypename: text\n  - vouchernumber: text\n  - serialmaster: text\n  - areserialmaster: text\n  - numberingstyle: text\n  - persistedview: text\n  - isdeleted: text\n  - asoriginal: text\n  - isdeemedpositive: text\n  - isinvoice: text\n  - aspayslip: text\n  - isdeletedvchretained: text\n  - isnegisposset: text\n  - masterid: text\n  - voucherkey: text\n  - voucherretainkey: text\n  - reuseholeid: text\n  - totalamount: text\n  - crdr: text\n  - vouchernumberseries: text\n\nTable: ledgergroups\n  - samplingdateonefactor: text\n  - samplingdatetwofactor: text\n  - activefrom: text\n  - activeto: text\n  - guid: text\n  - parent: text\n  - samplingmethod: text\n  - samplingstronefactor: text\n  - narration: text\n  - enteredby: text\n  - alteredby: text\n  - typeofupdateactivity: text\n  - objectupdateaction: text\n  - requestorrule: text\n  - basicgroupiscalculable: text\n  - addlalloctype: text\n  - grpdebitparent: text\n  - grpcreditparent: text\n  - sysdebitparent: text\n  - syscreditparent: text\n  - balancingtype: text\n  - tdsapplicable: text\n  - tcsapplicable: text\n  - gstapplicable: text\n  - isbillwiseon: text\n  - iscostcentreson: text\n  - isaddable: text\n  - isupdatingtargetid: text\n  - isdeleted: text\n  - issecurityonwhenentered: text\n  - asoriginal: text\n  - issubledger: text\n  - isrevenue: text\n  - affectsgrossprofit: text\n  - isdeemedpositive: text\n  - tracknegativebalances: text\n  - iscondensed: text\n  - affectsstock: text\n  - isgroupforloanrcpt: text\n  - isgroupforloanpymnt: text\n  - israteinclusivevat: text\n  - isinvdetailsenable: text\n  - samplingnumonefactor: text\n  - samplingnumtwofactor: text\n  - errkey: text\n  - sortposition: text\n  - alterid: text\n  - samplingamtonefactor: text\n  - samplingamttwofactor: text\n  - updateddatetime: text\n  - tempgstcgstrate: text\n  - tempgstsgstrate: text\n  - tempgstigstrate: text\n  - tempgstcessrate: text\n  - tempgstcessqtyrate: text\n  - tempgststatecessrate: text\n  - tempapplicablefrom: text\n  - tempisreversechargeappl: text\n  - tempgsteligibleitc: text\n  - tempgstinclexpforslabtax: text\n  - tempgstcalcslabonmrp: text\n  - tempgstclassification: text\n  - tempgsttaxablility: text\n  - tempgstnatureoftransaction: text\n  - tempsrcofgstdetails: text\n  - tempgsttaxrate: text\n  - tempgstcessvaltype: text\n  - tempgstslabcessvaltype: text\n  - tempgstslabcessrate: text\n  - tempgstslabcessqtyrate: text\n  - tempgstslabstatecessrate: text\n  - tempgsthsnapplfrom: text\n  - tempsrcofhsndetails: text\n  - tempgsthsnclassification: text\n  - tempgsthsncode: text\n  - tempgsthsndescription: text\n  - tempgsttaxablilitygstclassif: text\n  - tempgstnatureoftransactiongstclassif: text\n  - tempgstigstrategstclassif: text\n  - tempgstcgstrategstclassif: text\n  - tempgstsgstrategstclassif: text\n  - tempgstcessvaltypegstclassif: text\n  - tempgstcessqtyrategstclassif: text\n  - tempgststatecessrategstclassif: text\n  - tempisreversechargeapplgstclassif: text\n  - tempgsteligibleitcgstclassif: text\n  - tempgstcessrategstclassif: text\n  - tempgsthsncodegstclassif: text\n  - tempgsthsndescriptiongstclassif: text\n  - tempgroupnature: text\n  - tempaffectsgp: text\n  - temptaxtype: text\n  - tempisvatfieldsedited: text\n  - tempappldate: text\n  - tempclassification: text\n  - tempnature: text\n  - temppartyentity: text\n  - tempbusinessnature: text\n  - tempvatrate: text\n  - tempaddltax: text\n  - tempcessonvat: text\n  - tempmajorcommodityname: text\n  - tempcommodityname: text\n  - tempcommoditycode: text\n  - tempsubcommoditycode: text\n  - tempuom: text\n  - temptypeofgoods: text\n  - temptradename: text\n  - tempgoodsnature: text\n  - tempschedule: text\n  - tempscheduleslno: text\n  - tempisinvdetailsenable: text\n  - templocalvatrate: text\n  - tempvaluationtype: text\n  - tempiscalconqty: text\n  - servicetaxdetailslist: text\n  - vatdetailslist: text\n  - salestaxcessdetailslist: text\n  - gstdetailslist: text\n  - hsndetailslist: text\n  - languagenamelist: text\n  - xbrldetaillist: text\n  - auditdetailslist: text\n  - schvidetailslist: text\n  - excisetariffdetailslist: text\n  - tcscategorydetailslist: text\n  - tdscategorydetailslist: text\n  - tempgstitemslabrateslist: text\n  - gstclassfnigstrateslist: text\n  - extariffdutyheaddetailslist: text\n\nTable: ledgers\n  - oldauditentryidslist: text\n  - startingfrom: text\n  - stregdate: text\n  - lbtregndate: text\n  - vatregistrationdate: text\n  - cstregistrationdate: text\n  - samplingdateonefactor: text\n  - samplingdatetwofactor: text\n  - activefrom: text\n  - activeto: text\n  - createddate: text\n  - alteredon: text\n  - vatapplicabledate: text\n  - exciseregistrationdate: text\n  - panapplicablefrom: text\n  - payinsrunningfiledate: text\n  - vattaxexemptiondate: text\n  - banklastimportstmtdate: text\n  - guid: text\n  - currencyname: text\n  - email: text\n  - priorstatename: text\n  - website: text\n  - incometaxnumber: text\n  - salestaxnumber: text\n  - interstatestnumber: text\n  - vattinnumber: text\n  - exciserange: text\n  - excisedivision: text\n  - excisecommissionerate: text\n  - lbtregnno: text\n  - lbtzone: text\n  - exportimportcode: text\n  - branchname: text\n  - interstateoldstnumber: text\n  - vatoldtinnumber: text\n  - vatdistrictname: text\n  - gstregistrationtype: text\n  - vatdealertype: text\n  - statename: text\n  - pricelevel: text\n  - uploadlastrefresh: text\n  - parent: text\n  - samplingmethod: text\n  - samplingstronefactor: text\n  - ifscode: text\n  - narration: text\n  - remoteguid: text\n  - remotealtguid: text\n  - enteredby: text\n  - alteredby: text\n  - typeofupdateactivity: text\n  - objectupdateaction: text\n  - grpdebitparent: text\n  - grpcreditparent: text\n  - sysdebitparent: text\n  - syscreditparent: text\n  - tdsapplicable: text\n  - tcsapplicable: text\n  - gstapplicable: text\n  - createdby: text\n  - taxclassificationname: text\n  - taxtype: text\n  - billcreditperiod: text\n  - bankdetails: text\n  - bankbsrcode: text\n  - deducteetype: text\n  - businesstype: text\n  - typeofnotification: text\n  - msmeregnumber: text\n  - countryofresidence: text\n  - relatedpartyid: text\n  - relpartyissuingauthority: text\n  - importerexportercode: text\n  - emailcc: text\n  - description: text\n  - ledaddlalloctype: text\n  - transporterid: text\n  - oldpincode: text\n  - ledgerphone: text\n  - ledgerfax: text\n  - ledgercontact: text\n  - ledgermobile: text\n  - relationtype: text\n  - ledgercountryisdcode: text\n  - mailingnamenative: text\n  - statenamenative: text\n  - countrynamenative: text\n  - basictypeofduty: text\n  - gsttype: text\n  - exemptiontype: text\n  - appropriatefor: text\n  - subtaxtype: text\n  - stxnatureofparty: text\n  - nameonpan: text\n  - usedfortaxtype: text\n  - ecommmerchantid: text\n  - partygstin: text\n  - gstdutyhead: text\n  - gstappropriateto: text\n  - gsttypeofsupply: text\n  - gstnatureofsupply: text\n  - cessvaluationmethod: text\n  - partyoldgstin: text\n  - oldledstatename: text\n  - philippinesledvatclass: text\n  - vatdealernature: text\n  - paytype: text\n  - payslipname: text\n  - attendancetype: text\n  - leavetype: text\n  - calculationperiod: text\n  - roundingmethod: text\n  - computationtype: text\n  - calculationtype: text\n  - paystattype: text\n  - professionaltaxnumber: text\n  - userdefinedcalendertype: text\n  - itnature: text\n  - itcomponent: text\n  - notificationnumber: text\n  - registrationnumber: text\n  - servicecategory: text\n  - abatementnotificationno: text\n  - stxdutyhead: text\n  - stxclassification: text\n  - notificationslno: text\n  - servicetaxapplicable: text\n  - exciseledgerclassification: text\n  - exciseregistrationnumber: text\n  - exciseaccounthead: text\n  - excisedutytype: text\n  - excisedutyheadcode: text\n  - excisealloctype: text\n  - excisedutyhead: text\n  - natureofsales: text\n  - excisenotificationno: text\n  - exciseimportsregistartionno: text\n  - exciseapplicability: text\n  - excisetypeofbranch: text\n  - excisedefaultremoval: text\n  - excisenotificationslno: text\n  - typeoftariff: text\n  - exciseregno: text\n  - excisenatureofpurchase: text\n  - tdsdeducteetypemst: text\n  - tdsratename: text\n  - tdsdeducteesectionnumber: text\n  - panstatus: text\n  - deducteereference: text\n  - tdsdeducteetype: text\n  - itexemptapplicable: text\n  - taxidentificationno: text\n  - ledgerfbtcategory: text\n  - branchcode: text\n  - clientcode: text\n  - bankingconfigbank: text\n  - bankingconfigbankid: text\n  - bankaccholdername: text\n  - useforpostype: text\n  - paymentgateway: text\n  - typeofintereston: text\n  - bankconfigifsc: text\n  - bankconfigmicr: text\n  - bankconfigshortcode: text\n  - pymtinstoutputname: text\n  - productcodetype: text\n  - salarypymtproductcode: text\n  - otherpymtproductcode: text\n  - paymentinstlocation: text\n  - encrptionlocation: text\n  - newimflocation: text\n  - importedimflocation: text\n  - banknewstatements: text\n  - bankimportedstatements: text\n  - bankmicr: text\n  - corporateusernoecs: text\n  - corporateusernoach: text\n  - corporateusername: text\n  - imfname: text\n  - payinsbatchname: text\n  - lastusedbatchname: text\n  - payinsfilenumperiod: text\n  - encryptedby: text\n  - encryptedid: text\n  - isocurrencycode: text\n  - bankcapsuleid: text\n  - salestaxcessapplicable: text\n  - bankiban: text\n  - vattaxexemptionnature: text\n  - vattaxexemptionnumber: text\n  - oldcountryname: text\n  - vatapplicable: text\n  - partybusinesstype: text\n  - partybusinessstyle: text\n  - swiftcode: text\n  - ebankingformat: text\n  - virtualpaymentaddress: text\n  - banklastfetchstmtformat: text\n  - defaulttransfermode: text\n  - defaultwithdrawvchtype: text\n  - defaultdepositvchtype: text\n  - defaultcontravchtype: text\n  - banklastfetchbalacctnum: text\n  - bankperfectmatchconfig: text\n  - defaultnumseriesdeposit: text\n  - defaultnumserieswithdrawl: text\n  - defaultnumseriesinternaltransfer: text\n  - isbillwiseon: text\n  - iscostcentreson: text\n  - isintereston: text\n  - allowinmobile: text\n  - iscosttrackingon: text\n  - isbeneficiarycodeon: text\n  - isexportonvchcreate: text\n  - plasincomeexpense: text\n  - ismstfromsync: text\n  - isupdatingtargetid: text\n  - isdeleted: text\n  - issecurityonwhenentered: text\n  - asoriginal: text\n  - iscondensed: text\n  - affectsstock: text\n  - israteinclusivevat: text\n  - forpayroll: text\n  - isabcenabled: text\n  - iscreditdayschkon: text\n  - interestonbillwise: text\n  - overrideinterest: text\n  - overrideadvinterest: text\n  - useforvat: text\n  - ignoretdsexempt: text\n  - istcsapplicable: text\n  - istdsapplicable: text\n  - isfbtapplicable: text\n  - isgstapplicable: text\n  - isexciseapplicable: text\n  - istdsexpense: text\n  - isedliapplicable: text\n  - isrelatedparty: text\n  - useforesieligibility: text\n  - isinterestincllastday: text\n  - appropriatetaxvalue: text\n  - isbehaveasduty: text\n  - interestincldayofaddition: text\n  - interestincldayofdeduction: text\n  - isothterritoryassessee: text\n  - ignoremismatchwithwarning: text\n  - useasnotionalbank: text\n  - behaveaspaymentgateway: text\n  - overridecreditlimit: text\n  - isagainstformc: text\n  - ischequeprintingenabled: text\n  - ispayupload: text\n  - ispaybatchonlysal: text\n  - isbnfcodesupported: text\n  - allowexportwitherrors: text\n  - considerpurchaseforexport: text\n  - istransporter: text\n  - isecashledger: text\n  - usefornotionalitc: text\n  - isecommoperator: text\n  - overridebasedonrealization: text\n  - isecdiffinsdate: text\n  - showinpayslip: text\n  - useforgratuity: text\n  - istdsprojected: text\n  - issalarymulfile: text\n  - forservicetax: text\n  - isinputcredit: text\n  - isexempted: text\n  - isabatementapplicable: text\n  - isstxparty: text\n  - isstxnonrealizedtype: text\n  - useforkkc: text\n  - useforsbc: text\n  - isusedforcvd: text\n  - ledbelongstonontaxable: text\n  - isexcisemerchantexporter: text\n  - ispartyexempted: text\n  - issezparty: text\n  - tdsdeducteeisspecialrate: text\n  - isechequesupported: text\n  - iseddsupported: text\n  - hasechequedeliverymode: text\n  - hasechequedeliveryto: text\n  - hasechequeprintlocation: text\n  - hasechequepayablelocation: text\n  - hasechequebanklocation: text\n  - hasedddeliverymode: text\n  - hasedddeliveryto: text\n  - haseddprintlocation: text\n  - haseddpayablelocation: text\n  - haseddbanklocation: text\n  - isebankingenabled: text\n  - isexportfileencrypted: text\n  - isbatchenabled: text\n  - isproductcodebased: text\n  - haseddcity: text\n  - hasechequecity: text\n  - isfilenameformatsupported: text\n  - hasclientcode: text\n  - payinsisbatchapplicable: text\n  - payinsisfilenumapp: text\n  - issalarytransgroupedforbrs: text\n  - isebankingsupported: text\n  - isscbuae: text\n  - isbankstatusapp: text\n  - issalarygrouped: text\n  - useforpurchasetax: text\n  - bankisreconcileperfectmatches: text\n  - ispymtadvonline: text\n  - ispymtadvccenabled: text\n  - isincludepymtadvbillwise: text\n  - audited: text\n  - samplingnumonefactor: text\n  - samplingnumtwofactor: text\n  - errkey: text\n  - sortposition: text\n  - alterid: text\n  - remotealterid: text\n  - defaultlanguage: text\n  - rateoftaxcalculation: text\n  - gratuitymonthdays: text\n  - gratuitylimitmonths: text\n  - calculationbasis: text\n  - roundinglimit: text\n  - abatementpercentage: text\n  - tdsdeducteespecialrate: text\n  - beneficiarycodemaxlength: text\n  - echequeprintlocationversion: text\n  - echequepayablelocationversion: text\n  - eddprintlocationversion: text\n  - eddpayablelocationversion: text\n  - payinsrunningfilenum: text\n  - transactiontypeversion: text\n  - payinsfilenumlength: text\n  - openingbalance: text\n  - samplingamtonefactor: text\n  - samplingamttwofactor: text\n  - creditlimit: text\n  - gratuitylimitamount: text\n  - odlimit: text\n  - banklastfetchbalance: text\n  - updateddatetime: text\n  - banklastfetchbalancedatetime: text\n  - servicetaxdetailslist: text\n  - lbtregndetailslist: text\n  - vatdetailslist: text\n  - salestaxcessdetailslist: text\n  - gstdetailslist: text\n  - hsndetailslist: text\n  - msmeregistrationdetailslist: text\n  - languagenamelist: text\n  - xbrldetaillist: text\n  - auditdetailslist: text\n  - schvidetailslist: text\n  - excisetariffdetailslist: text\n  - tcscategorydetailslist: text\n  - tdscategorydetailslist: text\n  - slabperiodlist: text\n  - gratuityperiodlist: text\n  - additionalcomputationslist: text\n  - excisejurisdictiondetailslist: text\n  - excludedtaxationslist: text\n  - bankallocationslist: text\n  - paymentdetailslist: text\n  - bankexportformatslist: text\n  - transfermodelimitdetailslist: text\n  - bankledgerbalancedetailslist: text\n  - billallocationslist: text\n  - interestcollectionlist: text\n  - ledgerclosingvalueslist: text\n  - ledgerauditclasslist: text\n  - oldauditentrieslist: text\n  - tdsexemptionruleslist: text\n  - deductinsamevchruleslist: text\n  - lowerdeductionlist: text\n  - stxabatementdetailslist: text\n  - ledmultiaddresslistlist: text\n  - stxtaxdetailslist: text\n  - chequerangelist: text\n  - defaultvchchequedetailslist: text\n  - accountauditentrieslist: text\n  - auditentrieslist: text\n  - brsimportedinfolist: text\n  - autobrsconfigslist: text\n  - bankurentrieslist: text\n  - defaultchequedetailslist: text\n  - defaultopeningchequedetailslist: text\n  - cancelledpayallocationslist: text\n  - echequeprintlocationlist: text\n  - echequepayablelocationlist: text\n  - eddprintlocationlist: text\n  - eddpayablelocationlist: text\n  - availabletransactiontypeslist: text\n  - ledpayinsconfigslist: text\n  - typecodedetailslist: text\n  - fieldvalidationdetailslist: text\n  - inputcrallocslist: text\n  - tcsmethodofcalculationlist: text\n  - ledgstregdetailslist: text\n  - ledmailingdetailslist: text\n  - gstreconprefixsuffixdetailslist: text\n  - contactdetailslist: text\n\nTable: query_cache\n  - updated_at: timestamp without time zone\n  - sql_result: json\n  - executed_at: timestamp with time zone\n  - created_at: timestamp without time zone\n  - id: uuid\n  - generated_sql: text\n  - affected_tables: ARRAY\n  - summary: text\n  - prompt_hash: character varying\n  - user_id: character varying\n  - prompt: text\n  - full_prompt: text\n  - db_schema: text	SELECT SUM(CAST(totalamount AS NUMERIC)) AS total_purchase_2019\nFROM vouchers\nWHERE vouchertypename ILIKE '%purchase%'\n  AND date >= '2019-01-01' AND date <= '2019-12-31'	[{"total_purchase_2019": 337349.51}]	In 2019, the total purchase amount was $337,349.51.	19d7765e7bd1ea85e8b2f2233aff2f82b6b6d807f639344bdb0a5830041faaaf	2025-07-03 10:17:16.370252+00	{transactions}	\N	\N
\.


--
-- TOC entry 3390 (class 0 OID 33405)
-- Dependencies: 223
-- Data for Name: stockgroups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stockgroups (activefrom, activeto, guid, parent, narration, remoteguid, remotealtguid, enteredby, alteredby, typeofupdateactivity, objectupdateaction, tdsapplicable, tcsapplicable, gstapplicable, costingmethod, valuationmethod, baseunits, additionalunits, excisetaxtype, isbatchwiseon, isperishableon, isaddable, ismstfromsync, isupdatingtargetid, isdeleted, issecurityonwhenentered, asoriginal, ignorephysicaldifference, ignorenegativestock, treatsalesasmanufactured, treatpurchasesasconsumed, treatrejectsasscrap, hasmfgdate, allowuseofexpireditems, ignorebatches, ignoregodowns, errkey, alterid, remotealterid, denominator, conversion, updateddatetime, servicetaxdetailslist, vatdetailslist, salestaxcessdetailslist, gstdetailslist, hsndetailslist, languagenamelist, schvidetailslist, excisetariffdetailslist, tcscategorydetailslist, tdscategorydetailslist) FROM stdin;
		667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-00000159	 Primary			667653ae-9a3a-48fa-94ee-ee5e6c0c80b8										 Not Applicable	 Not Applicable		No	No	No					No	No	No	No	No	No	No	No	No	No	0	 1399	0	0	0	000000000				20180401As per Company/Stock GroupYes0 AnyCGSTBased on Value00SGST/UTGSTBased on Value00IGSTBased on Value00Cess Not Applicable00State CessBased on Value00	20180401As per Company/Stock Group	Laptops 1033				
\.


--
-- TOC entry 3382 (class 0 OID 33365)
-- Dependencies: 215
-- Data for Name: stockitem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stockitem (oldauditentryidslist, activefrom, activeto, priceleveldate, guid, pricelevel, parent, category, narration, remoteguid, remotealtguid, enteredby, alteredby, typeofupdateactivity, objectupdateaction, tdsapplicable, tcsapplicable, gstapplicable, taxclassificationname, description, gsttypeofsupply, servicetaxapplicable, exciseapplicability, salestaxcessapplicable, vatapplicable, ledgername, costingmethod, valuationmethod, baseunits, additionalunits, excisetaxtype, natureofitem, exciseitemclassification, oldbasictarifftype, tcscategory, basictarifftype, vatcommodity, entrytaxcommodity, vatbaseunit, vattrailunit, vatschdlentrtyno, reorderperiod, reorderroundtype, minorderperiod, minorderroundtype, gstrepuom, gstconvunit, iscostcentreson, isbatchwiseon, isperishableon, isentrytaxapplicable, iscosttrackingon, ismstfromsync, isupdatingtargetid, isdeleted, issecurityonwhenentered, asoriginal, israteinclusivevat, ignorephysicaldifference, ignorenegativestock, treatsalesasmanufactured, treatpurchasesasconsumed, treatrejectsasscrap, hasmfgdate, allowuseofexpireditems, ignorebatches, ignoregodowns, adjdiffinfirstsaleledger, adjdiffinfirstpurcledger, calconmrp, excludejrnlforvaluation, ismrpincloftax, isaddltaxexempt, issupplementrydutyon, gvatisexciseappl, isadditionaltax, iscessexempted, reorderashigher, minorderashigher, isexcisecalculateonmrp, inclusivetax, gstcalcslabonmrp, modifymrprate, errkey, alterid, remotealterid, denominator, conversion, rateofmrp, basicrateofexcise, rateofentrytax, rateofvat, rateofsat, vatbaseno, vattrailno, vatactualratio, reorderperiodlength, reorderroundlimit, minorderperiodlength, minorderroundlimit, gstitemunits, gstrepunits, openingbalance, openingvalue, basicvalue, basicqty, reorderbase, minimumorderbase, openingrate, updateddatetime, servicetaxdetailslist, vatdetailslist, salestaxcessdetailslist, gstdetailslist, hsndetailslist, languagenamelist, schvidetailslist, excisetariffdetailslist, tcscategorydetailslist, tdscategorydetailslist, excludedtaxationslist, oldauditentrieslist, accountauditentrieslist, auditentrieslist, oldmrpdetailslist, vatclassificationdetailslist, mrpdetailslist, reportinguomdetailslist, componentlistlist, additionalledgerslist, saleslistlist, purchaselistlist, fullpricelistlist, batchallocationslist, traderexcisedutieslist, standardcostlistlist, standardpricelistlist, exciseitemgodownlist, multicomponentlistlist, lbtdetailslist, pricelevellistlist) FROM stdin;
-1				667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-0000015a		Laptops	 Not Applicable			667653ae-9a3a-48fa-94ee-ee5e6c0c80b8							 Applicable	 Not Applicable		Goods		 Not Applicable	 Applicable	 Applicable		Default	Default	 Not Applicable	 Not Applicable																		No	No	No		No					No		No	No	No	No	No	No	No	No	No			No		No				No	No	No	No			No	No	0	 1400	0	 1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0		0.00						000000000				20180401As per Company/Stock GroupYes0 AnyCGSTBased on Value00SGST/UTGSTBased on Value00IGSTBased on Value00Cess Not Applicable00State CessBased on Value00	20180401As per Company/Stock Group	Dell Laptop 1033																									
\.


--
-- TOC entry 3383 (class 0 OID 33370)
-- Dependencies: 216
-- Data for Name: voucherledgerentries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.voucherledgerentries (guid, taxclassificationname, appropriatefor, ledgername, statnaturename, statclassificationname, exciseclassificationname, iszrbasicservice, vatcommodityname, schedule, scheduleserialnumber, vatcommoditycode, tdspartyname, vatpartyorgname, vatcalculationtype, vatworkscontracttype, vatwcdescription, gstclass, gstovrdnclassification, gstovrdnnature, gstovrdnineligibleitc, gstovrdnisrevchargeappl, gstovrdntaxability, gsthsnsaccode, gstovrdnstorednature, gsthsnname, gsthsndescription, isdeemedpositive, ledgerfromitem, ispartyledger, islastdeemedpositive, iscapvatnotclaimed, rateofaddlvat, rateofcessonvat, vattaxrate, vatitemqty, vatwcdeductrate, vatwcdeductionrate, gsttaxrate, amount, crdr, cessassvalonclass, addnlvatclassamt, vatassessablevalue, vatwccostofland, vatwcdedlabourcharges, vatwcotherdeductionamt, vatwcvalueoftaxfreegoods, vatwcothercharges, vatwcsubcontractoramt, vatwcdeductamt, wctotaldeductionamt, vatwcdeductionamount, originvgoodsvalue, cenvatcaptinputamt, gstassessablevalue, igstliability, cgstliability, sgstliability, gstcessliability, gstovrdnassessablevalue, gstassblvalue, vatexpamount) FROM stdin;
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001cb		 Not Applicable	M/s 3CIT Solutions & Telecoms(India)Pvt.Ltd.														 Not Applicable										No	No	Yes	No	No	0	0	0	0	0	0	0	11800.00	Cr																						11800.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001cb		 Not Applicable	Net 18% (FA)														 Not Applicable	\N	\N	 Not Applicable	 Not Applicable	Taxable	\N	Local Purchase - Taxable	\N	\N	Yes	No	No	Yes	No	0	0	0	0	0	0	\N	-10000.00	Dr															\N	\N	\N	\N	\N	\N	\N	-10000.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001cb		 Not Applicable	CGST 9% (FA)														 Not Applicable										Yes	No	No	Yes	No	0	0	0	0	0	0	0	-900.00	Dr																						-900.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001cb		 Not Applicable	SGST 9% (FA)														 Not Applicable										Yes	No	No	Yes	No	0	0	0	0	0	0	0	-900.00	Dr																						-900.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001cc		 Not Applicable	M/s Aj Enterprises														 Not Applicable										No	No	Yes	No	No	0	0	0	0	0	0	0	491.00	Cr																						491.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001cc		 Not Applicable	18% Net Amt GST														 Not Applicable	\N	\N	 Not Applicable	 Not Applicable	Taxable	\N	 System Inferred	\N	\N	Yes	No	No	Yes	No	0	0	0	0	0	0	\N	-416.10	Dr															\N	\N	\N	\N	\N	\N	\N	-416.10
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001cc		 Not Applicable	CGST 9%														 Not Applicable										Yes	No	No	Yes	No	0	0	0	0	0	0	0	-37.45	Dr																						-37.45
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001cc		 Not Applicable	SGST 9%														 Not Applicable										Yes	No	No	Yes	No	0	0	0	0	0	0	0	-37.45	Dr																						-37.45
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001cd		 Not Applicable	M/s Aj Enterprises														 Not Applicable										No	No	Yes	No	No	0	0	0	0	0	0	0	2950.00	Cr																						2950.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001cd		 Not Applicable	18% Net Amt GST														 Not Applicable	\N	\N	 Not Applicable	 Not Applicable	Taxable	\N	 System Inferred	\N	\N	Yes	No	No	Yes	No	0	0	0	0	0	0	\N	-2500.00	Dr															\N	\N	\N	\N	\N	\N	\N	-2500.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001cd		 Not Applicable	CGST 9%														 Not Applicable										Yes	No	No	Yes	No	0	0	0	0	0	0	0	-225.00	Dr																						-225.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001cd		 Not Applicable	SGST 9%														 Not Applicable										Yes	No	No	Yes	No	0	0	0	0	0	0	0	-225.00	Dr																						-225.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001ce		 Not Applicable	M/s Aj Enterprises														 Not Applicable										No	No	Yes	No	No	0	0	0	0	0	0	0	2950.00	Cr																						2950.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001ce		 Not Applicable	18% Net Amt GST														 Not Applicable	\N	\N	 Not Applicable	 Not Applicable	Taxable	\N	 System Inferred	\N	\N	Yes	No	No	Yes	No	0	0	0	0	0	0	\N	-2500.00	Dr															\N	\N	\N	\N	\N	\N	\N	-2500.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001ce		 Not Applicable	CGST 9%														 Not Applicable										Yes	No	No	Yes	No	0	0	0	0	0	0	0	-225.00	Dr																						-225.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001ce		 Not Applicable	SGST 9%														 Not Applicable										Yes	No	No	Yes	No	0	0	0	0	0	0	0	-225.00	Dr																						-225.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001cf		 Not Applicable	M/s Aj Enterprises														 Not Applicable										No	No	Yes	No	No	0	0	0	0	0	0	0	1475.00	Cr																						1475.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001cf		 Not Applicable	18% Net Amt GST														 Not Applicable	\N	\N	 Not Applicable	 Not Applicable	Taxable	\N	 System Inferred	\N	\N	Yes	No	No	Yes	No	0	0	0	0	0	0	\N	-1250.00	Dr															\N	\N	\N	\N	\N	\N	\N	-1250.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001cf		 Not Applicable	CGST 9%														 Not Applicable										Yes	No	No	Yes	No	0	0	0	0	0	0	0	-112.50	Dr																						-112.50
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001cf		 Not Applicable	SGST 9%														 Not Applicable										Yes	No	No	Yes	No	0	0	0	0	0	0	0	-112.50	Dr																						-112.50
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001d0		 Not Applicable	M/s Aj Enterprises														 Not Applicable										No	No	Yes	No	No	0	0	0	0	0	0	0	2950.00	Cr																						2950.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001d0		 Not Applicable	18% Net Amt GST														 Not Applicable	\N	\N	 Not Applicable	 Not Applicable	Taxable	\N	 System Inferred	\N	\N	Yes	No	No	Yes	No	0	0	0	0	0	0	\N	-2500.00	Dr															\N	\N	\N	\N	\N	\N	\N	-2500.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001d0		 Not Applicable	CGST 9%														 Not Applicable										Yes	No	No	Yes	No	0	0	0	0	0	0	0	-225.00	Dr																						-225.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001d0		 Not Applicable	SGST 9%														 Not Applicable										Yes	No	No	Yes	No	0	0	0	0	0	0	0	-225.00	Dr																						-225.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001d1		 Not Applicable	Tamanna Khan (Rent)														 Not Applicable										No	No	Yes	No	No	0	0	0	0	0	0	0	20000.00	Cr																						20000.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001d1		 Not Applicable	URD Purchase														 Not Applicable										Yes	No	No	Yes	No	0	0	0	0	0	0	0	-20000.00	Dr																						-20000.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001d2		 Not Applicable	M/s Webcon IT Solutions P Limited														 Not Applicable										No	No	Yes	No	No	0	0	0	0	0	0	0	21266.00	Cr																						21266.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001d2		 Not Applicable	18% Net IGST (FA)														 Not Applicable	\N	\N	 Not Applicable	 Not Applicable	Taxable	\N	Local Purchase - Taxable	\N	\N	Yes	No	No	Yes	No	0	0	0	0	0	0	\N	-18022.04	Dr															\N	\N	\N	\N	\N	\N	\N	-18022.04
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001d2		 Not Applicable	IGST 18% (FA)														 Not Applicable										Yes	No	No	Yes	No	0	0	0	0	0	0	0	-3243.96	Dr																						-3243.96
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001d3		 Not Applicable	M/s 3CIT Solutions & Telecoms(India)Pvt.Ltd.														 Not Applicable										No	No	Yes	No	No	0	0	0	0	0	0	0	11800.00	Cr																						11800.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001d3		 Not Applicable	Net 18% (FA)														 Not Applicable	\N	\N	 Not Applicable	 Not Applicable	Taxable	\N	Local Purchase - Taxable	\N	\N	Yes	No	No	Yes	No	0	0	0	0	0	0	\N	-10000.00	Dr															\N	\N	\N	\N	\N	\N	\N	-10000.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001d3		 Not Applicable	CGST 9% (FA)														 Not Applicable										Yes	No	No	Yes	No	0	0	0	0	0	0	0	-900.00	Dr																						-900.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001d3		 Not Applicable	SGST 9% (FA)														 Not Applicable										Yes	No	No	Yes	No	0	0	0	0	0	0	0	-900.00	Dr																						-900.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001d4		 Not Applicable	M/s Webcon IT Solutions P Limited														 Not Applicable										No	No	Yes	No	No	0	0	0	0	0	0	0	7646.00	Cr																						7646.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001d4		 Not Applicable	18% Net IGST (FA)														 Not Applicable	\N	\N	 Not Applicable	 Not Applicable	Taxable	\N	Local Purchase - Taxable	\N	\N	Yes	No	No	Yes	No	0	0	0	0	0	0	\N	-6479.66	Dr															\N	\N	\N	\N	\N	\N	\N	-6479.66
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001d4		 Not Applicable	IGST 18% (FA)														 Not Applicable										Yes	No	No	Yes	No	0	0	0	0	0	0	0	-1166.34	Dr																						-1166.34
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001d5		 Not Applicable	M/s Webcon IT Solutions P Limited														 Not Applicable										No	No	Yes	No	No	0	0	0	0	0	0	0	2950.00	Cr																						2950.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001d5		 Not Applicable	18% Net IGST (FA)														 Not Applicable	\N	\N	 Not Applicable	 Not Applicable	Taxable	\N	Local Purchase - Taxable	\N	\N	Yes	No	No	Yes	No	0	0	0	0	0	0	\N	-2500.00	Dr															\N	\N	\N	\N	\N	\N	\N	-2500.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001d5		 Not Applicable	IGST 18% (FA)														 Not Applicable										Yes	No	No	Yes	No	0	0	0	0	0	0	0	-450.00	Dr																						-450.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001d6		 Not Applicable	M/s 3CIT Solutions & Telecoms(India)Pvt.Ltd.														 Not Applicable										No	No	Yes	No	No	0	0	0	0	0	0	0	6700.00	Cr																						6700.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001d6		 Not Applicable	Net 18% (FA)														 Not Applicable	\N	\N	 Not Applicable	 Not Applicable	Taxable	\N	Local Purchase - Taxable	\N	\N	Yes	No	No	Yes	No	0	0	0	0	0	0	\N	-5677.96	Dr															\N	\N	\N	\N	\N	\N	\N	-5677.96
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001d6		 Not Applicable	CGST 9% (FA)														 Not Applicable										Yes	No	No	Yes	No	0	0	0	0	0	0	0	-511.02	Dr																						-511.02
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001d6		 Not Applicable	SGST 9% (FA)														 Not Applicable										Yes	No	No	Yes	No	0	0	0	0	0	0	0	-511.02	Dr																						-511.02
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001d7		 Not Applicable	M/s 3CIT Solutions & Telecoms(India)Pvt.Ltd.														 Not Applicable										No	No	Yes	No	No	0	0	0	0	0	0	0	2832.00	Cr																						2832.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001d7		 Not Applicable	Net 18% (FA)														 Not Applicable	\N	\N	 Not Applicable	 Not Applicable	Taxable	\N	Local Purchase - Taxable	\N	\N	Yes	No	No	Yes	No	0	0	0	0	0	0	\N	-2400.00	Dr															\N	\N	\N	\N	\N	\N	\N	-2400.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001d7		 Not Applicable	CGST 9% (FA)														 Not Applicable										Yes	No	No	Yes	No	0	0	0	0	0	0	0	-216.00	Dr																						-216.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001d7		 Not Applicable	SGST 9% (FA)														 Not Applicable										Yes	No	No	Yes	No	0	0	0	0	0	0	0	-216.00	Dr																						-216.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001d8		 Not Applicable	M/s Shivam Communication														 Not Applicable										No	No	Yes	No	No	0	0	0	0	0	0	0	3850.00	Cr																						3850.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001d8		 Not Applicable	Net 18% (FA)														 Not Applicable	\N	\N	 Not Applicable	 Not Applicable	Taxable	\N	Local Purchase - Taxable	\N	\N	Yes	No	No	Yes	No	0	0	0	0	0	0	\N	-3262.72	Dr															\N	\N	\N	\N	\N	\N	\N	-3262.72
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001d8		 Not Applicable	CGST 9% (FA)														 Not Applicable										Yes	No	No	Yes	No	0	0	0	0	0	0	0	-293.64	Dr																						-293.64
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001d8		 Not Applicable	SGST 9% (FA)														 Not Applicable										Yes	No	No	Yes	No	0	0	0	0	0	0	0	-293.64	Dr																						-293.64
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001d9		 Not Applicable	Tamanna Khan (Rent)														 Not Applicable										No	No	Yes	No	No	0	0	0	0	0	0	0	20000.00	Cr																						20000.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001d9		 Not Applicable	URD Purchase														 Not Applicable										Yes	No	No	Yes	No	0	0	0	0	0	0	0	-20000.00	Dr																						-20000.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001da		 Not Applicable	M/s 3CIT Solutions & Telecoms(India)Pvt.Ltd.														 Not Applicable										No	No	Yes	No	No	0	0	0	0	0	0	0	11800.00	Cr																						11800.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001da		 Not Applicable	18% Net Amt GST (Exp)														 Not Applicable	\N	\N	 Not Applicable	 Not Applicable	Taxable	\N	Local Purchase - Taxable	\N	\N	Yes	No	No	Yes	No	0	0	0	0	0	0	\N	-10000.00	Dr															\N	\N	\N	\N	\N	\N	\N	-10000.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001da		 Not Applicable	9% CGST (Exp)														 Not Applicable										Yes	No	No	Yes	No	0	0	0	0	0	0	0	-900.00	Dr																						-900.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001da		 Not Applicable	9% SGST (Exp)														 Not Applicable										Yes	No	No	Yes	No	0	0	0	0	0	0	0	-900.00	Dr																						-900.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001db		 Not Applicable	M/s 3CIT Solutions & Telecoms(India)Pvt.Ltd.														 Not Applicable										No	No	Yes	No	No	0	0	0	0	0	0	0	10620.00	Cr																						10620.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001db		 Not Applicable	18% Net Amt GST (Exp)														 Not Applicable	\N	\N	 Not Applicable	 Not Applicable	Taxable	\N	Local Purchase - Taxable	\N	\N	Yes	No	No	Yes	No	0	0	0	0	0	0	\N	-9000.00	Dr															\N	\N	\N	\N	\N	\N	\N	-9000.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001db		 Not Applicable	9% CGST (Exp)														 Not Applicable										Yes	No	No	Yes	No	0	0	0	0	0	0	0	-810.00	Dr																						-810.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001db		 Not Applicable	9% SGST (Exp)														 Not Applicable										Yes	No	No	Yes	No	0	0	0	0	0	0	0	-810.00	Dr																						-810.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001dc		 Not Applicable	Tamanna Khan (Rent)														 Not Applicable										No	No	Yes	No	No	0	0	0	0	0	0	0	20000.00	Cr																						20000.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001dc		 Not Applicable	URD Purchase														 Not Applicable										Yes	No	No	Yes	No	0	0	0	0	0	0	0	-20000.00	Dr																						-20000.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001dd		 Not Applicable	M/s Taskeen Khan (Rent)														 Not Applicable										No	No	Yes	No	No	0	0	0	0	0	0	0	70800.00	Cr																						70800.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001dd		 Not Applicable	18% Net Amt GST														 Not Applicable	\N	\N	 Not Applicable	 Not Applicable	Taxable	\N	 System Inferred	\N	\N	Yes	No	No	Yes	No	0	0	0	0	0	0	\N	-60000.00	Dr															\N	\N	\N	\N	\N	\N	\N	-60000.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001dd		 Not Applicable	CGST 9%														 Not Applicable										Yes	No	No	Yes	No	0	0	0	0	0	0	0	-5400.00	Dr																						-5400.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001dd		 Not Applicable	SGST 9%														 Not Applicable										Yes	No	No	Yes	No	0	0	0	0	0	0	0	-5400.00	Dr																						-5400.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001de		 Not Applicable	M/s 3CIT Solutions & Telecoms(India)Pvt.Ltd.														 Not Applicable										No	No	Yes	No	No	0	0	0	0	0	0	0	11800.00	Cr																						11800.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001de		 Not Applicable	18% Net Amt GST (Exp)														 Not Applicable	\N	\N	 Not Applicable	 Not Applicable	Taxable	\N	Local Purchase - Taxable	\N	\N	Yes	No	No	Yes	No	0	0	0	0	0	0	\N	-10000.00	Dr															\N	\N	\N	\N	\N	\N	\N	-10000.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001de		 Not Applicable	9% CGST (Exp)														 Not Applicable										Yes	No	No	Yes	No	0	0	0	0	0	0	0	-900.00	Dr																						-900.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001de		 Not Applicable	9% SGST (Exp)														 Not Applicable										Yes	No	No	Yes	No	0	0	0	0	0	0	0	-900.00	Dr																						-900.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001df		 Not Applicable	M/s 3CIT Solutions & Telecoms(India)Pvt.Ltd.														 Not Applicable										No	No	Yes	No	No	0	0	0	0	0	0	0	10620.00	Cr																						10620.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001df		 Not Applicable	18% Net Amt GST														 Not Applicable	\N	\N	 Not Applicable	 Not Applicable	Taxable	\N	 System Inferred	\N	\N	Yes	No	No	Yes	No	0	0	0	0	0	0	\N	-9000.00	Dr															\N	\N	\N	\N	\N	\N	\N	-9000.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001df		 Not Applicable	9% CGST (Exp)														 Not Applicable										Yes	No	No	Yes	No	0	0	0	0	0	0	0	-810.00	Dr																						-810.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001df		 Not Applicable	9% SGST (Exp)														 Not Applicable										Yes	No	No	Yes	No	0	0	0	0	0	0	0	-810.00	Dr																						-810.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001e0		 Not Applicable	M/s Raj Rajendra Electrosoft														 Not Applicable										No	No	Yes	No	No	0	0	0	0	0	0	0	4248.00	Cr																						4248.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001e0		 Not Applicable	18% Net Amt GST (Exp)														 Not Applicable	\N	\N	 Not Applicable	 Not Applicable	Taxable	\N	Local Purchase - Taxable	\N	\N	Yes	No	No	Yes	No	0	0	0	0	0	0	\N	-3600.00	Dr															\N	\N	\N	\N	\N	\N	\N	-3600.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001e0		 Not Applicable	9% CGST (Exp)														 Not Applicable										Yes	No	No	Yes	No	0	0	0	0	0	0	0	-324.00	Dr																						-324.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001e0		 Not Applicable	9% SGST (Exp)														 Not Applicable										Yes	No	No	Yes	No	0	0	0	0	0	0	0	-324.00	Dr																						-324.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001e1		 Not Applicable	M/s Embee Software Private Ltd														 Not Applicable										No	No	Yes	No	No	0	0	0	0	0	0	0	4311.00	Cr																						4311.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001e1		 Not Applicable	18% Net Amt IGST														 Not Applicable	\N	\N	 Not Applicable	 Not Applicable	Taxable	\N	 System Inferred	\N	\N	Yes	No	No	Yes	No	0	0	0	0	0	0	\N	-3653.38	Dr															\N	\N	\N	\N	\N	\N	\N	-3653.38
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001e1		 Not Applicable	IGST 18%														 Not Applicable										Yes	No	No	Yes	No	0	0	0	0	0	0	0	-657.62	Dr																						-657.62
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001e3		 Not Applicable	M/s Embee Software Private Ltd														 Not Applicable										No	No	Yes	No	No	0	0	0	0	0	0	0	2690.51	Cr																						2690.51
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001e3		 Not Applicable	18% Net Amt IGST														 Not Applicable	\N	\N	 Not Applicable	 Not Applicable	Taxable	\N	 System Inferred	\N	\N	Yes	No	No	Yes	No	0	0	0	0	0	0	\N	-2280.10	Dr															\N	\N	\N	\N	\N	\N	\N	-2280.10
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001e3		 Not Applicable	IGST 18%														 Not Applicable										Yes	No	No	Yes	No	0	0	0	0	0	0	0	-410.41	Dr																						-410.41
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001e4		 Not Applicable	M/s Taskeen Khan (Rent)														 Not Applicable										No	No	Yes	No	No	0	0	0	0	0	0	0	70800.00	Cr																						70800.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001e4		 Not Applicable	18% Net Amt GST														 Not Applicable	\N	\N	 Not Applicable	 Not Applicable	Taxable	\N	 System Inferred	\N	\N	Yes	No	No	Yes	No	0	0	0	0	0	0	\N	-60000.00	Dr															\N	\N	\N	\N	\N	\N	\N	-60000.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001e4		 Not Applicable	CGST 9%														 Not Applicable										Yes	No	No	Yes	No	0	0	0	0	0	0	0	-5400.00	Dr																						-5400.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001e4		 Not Applicable	SGST 9%														 Not Applicable										Yes	No	No	Yes	No	0	0	0	0	0	0	0	-5400.00	Dr																						-5400.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001e6		 Not Applicable	M/s Alpha Systems														 Not Applicable										Yes	No	Yes	Yes	No	0	0	0	0	0	0	0	-587898.00	Dr																						-587898.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001e6		\N	Software Sales														 Not Applicable	\N	\N	\N	 Not Applicable	Taxable	\N	 System Inferred	\N	\N	No	No	No	No	No	0	0	0	0	0	0	\N	587898.00	Cr															\N	\N	\N	\N	\N	\N	\N	587898.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001e7		 Not Applicable	M/s Classic Papers														 Not Applicable										Yes	No	Yes	Yes	No	0	0	0	0	0	0	0	-500000.00	Dr																						-500000.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001e7		\N	Software Sales														 Not Applicable	\N	\N	\N	 Not Applicable	Taxable	\N	 System Inferred	\N	\N	No	No	No	No	No	0	0	0	0	0	0	\N	500000.00	Cr															\N	\N	\N	\N	\N	\N	\N	500000.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001e8		 Not Applicable	M/s Nilesh Ganesh Pardeshi														 Not Applicable										Yes	No	Yes	Yes	No	0	0	0	0	0	0	0	-8920000.00	Dr																						-8920000.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001e8		\N	Software Sales														 Not Applicable	\N	\N	\N	 Not Applicable	Taxable	\N	 System Inferred	\N	\N	No	No	No	No	No	0	0	0	0	0	0	\N	8920000.00	Cr															\N	\N	\N	\N	\N	\N	\N	8920000.00
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001e9		 Not Applicable	M/s Bandewar Enterprises														 Not Applicable										Yes	No	Yes	Yes	No	0	0	0	0	0	0	0	-5000000.00	Dr																						\N
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001e9		\N	Cash														 Not Applicable										No	No	Yes	No	No	0	0	0	0	0	0	0	5000000.00	Cr																						\N
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001ea		 Not Applicable	Ganesh Ambadas Gayki														 Not Applicable										No	No	No	No	No	0	0	0	0	0	0	0	6980000.00	Cr																						\N
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001ea		\N	IndusInd Bank														 Not Applicable										Yes	No	Yes	Yes	No	0	0	0	0	0	0	0	-6980000.00	Dr																						\N
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001eb		 Not Applicable	Aruna Sudhakar Bhosale														 Not Applicable										No	No	No	No	No	0	0	0	0	0	0	0	5800050.00	Cr																						\N
667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001eb		\N	IndusInd Bank														 Not Applicable										Yes	No	Yes	Yes	No	0	0	0	0	0	0	0	-5800050.00	Dr																						\N
\.


--
-- TOC entry 3384 (class 0 OID 33375)
-- Dependencies: 217
-- Data for Name: vouchers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vouchers (date, guid, requestorrule, vouchertypename, vouchernumber, serialmaster, areserialmaster, numberingstyle, persistedview, isdeleted, asoriginal, isdeemedpositive, isinvoice, aspayslip, isdeletedvchretained, isnegisposset, masterid, voucherkey, voucherretainkey, reuseholeid, totalamount, crdr, vouchernumberseries) FROM stdin;
2019-04-02	667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001cb		Purchase	1			Manual	Accounting Voucher View	No	No	No	No	No	No	Yes	 459	187071595544584	365	0	11800.00	Cr	Default
2019-04-08	667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001cc		Purchase	2			Manual	Accounting Voucher View	No	No	No	No	No	No	Yes	 460	187097365348360	369	0	491.00	Cr	Default
2019-04-08	667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001cd		Purchase	3			Manual	Accounting Voucher View	No	No	No	No	No	No	Yes	 461	187097365348368	373	0	2950.00	Cr	Default
2019-04-30	667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001ce		Purchase	4			Manual	Accounting Voucher View	No	No	No	No	No	No	Yes	 462	187191854628872	377	0	2950.00	Cr	Default
2019-04-30	667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001cf		Purchase	5			Manual	Accounting Voucher View	No	No	No	No	No	No	Yes	 463	187191854628880	381	0	1475.00	Cr	Default
2019-04-30	667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001d0		Purchase	6			Manual	Accounting Voucher View	No	No	No	No	No	No	Yes	 464	187191854628888	385	0	2950.00	Cr	Default
2019-04-30	667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001d1		Purchase	7			Manual	Accounting Voucher View	No	No	No	No	No	No	Yes	 465	187191854628896	389	0	20000.00	Cr	Default
2019-05-02	667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001d2		Purchase	8			Manual	Accounting Voucher View	No	No	No	No	No	No	Yes	 466	187200444563464	393	0	21266.00	Cr	Default
2019-05-04	667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001d3		Purchase	9			Manual	Accounting Voucher View	No	No	No	No	No	No	Yes	 467	187209034498056	397	0	11800.00	Cr	Default
2019-05-04	667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001d4		Purchase	10			Manual	Accounting Voucher View	No	No	No	No	No	No	Yes	 468	187209034498064	401	0	7646.00	Cr	Default
2019-05-22	667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001d5		Purchase	11			Manual	Accounting Voucher View	No	No	No	No	No	No	Yes	 469	187286343909384	405	0	2950.00	Cr	Default
2019-05-23	667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001d6		Purchase	12			Manual	Accounting Voucher View	No	No	No	No	No	No	Yes	 470	187290638876680	409	0	6700.00	Cr	Default
2019-05-23	667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001d7		Purchase	13			Manual	Accounting Voucher View	No	No	No	No	No	No	Yes	 471	187290638876688	413	0	2832.00	Cr	Default
2019-05-29	667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001d8		Purchase	14			Manual	Accounting Voucher View	No	No	No	No	No	No	Yes	 472	187316408680456	417	0	3850.00	Cr	Default
2019-05-31	667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001d9		Purchase	15			Manual	Accounting Voucher View	No	No	No	No	No	No	Yes	 473	187324998615048	421	0	20000.00	Cr	Default
2019-06-06	667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001da		Purchase	17			Manual	Accounting Voucher View	No	No	No	No	No	No	Yes	 474	187350768418824	425	0	11800.00	Cr	Default
2019-06-06	667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001db		Purchase	18			Manual	Accounting Voucher View	No	No	No	No	No	No	Yes	 475	187350768418832	429	0	10620.00	Cr	Default
2019-06-30	667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001dc		Purchase	19			Manual	Accounting Voucher View	No	No	No	No	No	No	Yes	 476	187453847633928	433	0	20000.00	Cr	Default
2019-07-01	667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001dd		Purchase	20			Manual	Accounting Voucher View	No	No	No	No	No	No	Yes	 477	187458142601224	437	0	70800.00	Cr	Default
2019-07-02	667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001de		Purchase	21			Manual	Accounting Voucher View	No	No	No	No	No	No	Yes	 478	187462437568520	441	0	11800.00	Cr	Default
2019-07-02	667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001df		Purchase	22			Manual	Accounting Voucher View	No	No	No	No	No	No	Yes	 479	187462437568528	445	0	10620.00	Cr	Default
2019-07-04	667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001e0		Purchase	23			Manual	Accounting Voucher View	No	No	No	No	No	No	Yes	 480	187471027503112	449	0	4248.00	Cr	Default
2019-08-01	667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001e1		Purchase	24			Manual	Accounting Voucher View	No	No	No	No	No	No	Yes	 481	187591286587400	453	0	4311.00	Cr	Default
2019-08-01	667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001e3		Purchase	25			Manual	Accounting Voucher View	No	No	No	No	No	No	Yes	 483	187591286587408	457	0	2690.51	Cr	Default
2019-08-02	667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001e4		Purchase	26			Manual	Accounting Voucher View	No	No	No	No	No	No	Yes	 484	187595581554696	461	0	70800.00	Cr	Default
2019-08-02	667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001e6		Sales	1			Manual	Accounting Voucher View	No	No	Yes	No	No	No	Yes	 486	187595581554704	153	0	-587898.00	Dr	Default
2019-08-02	667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001e7		Sales	2			Manual	Accounting Voucher View	No	No	Yes	No	No	No	Yes	 487	187595581554712	157	0	-500000.00	Dr	Default
2019-10-01	667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001e8		Sales	3			Manual	Accounting Voucher View	No	No	Yes	No	No	No	Yes	 488	187853279592456	161	0	-8920000.00	Dr	Default
2019-10-01	667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001e9		Payment	1			Manual	Accounting Voucher View	No	No	Yes	No	No	No	Yes	 489	187853279592464	877	0	-5000000.00	Dr	Default
2019-10-01	667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001ea		Receipt	1			Manual	Accounting Voucher View	No	No	No	No	No	No	Yes	 490	187853279592472	173	0	6980000.00	Cr	Default
2019-10-01	667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-000001eb		Receipt	2			Manual	Accounting Voucher View	No	No	No	No	No	No	Yes	 491	187853279592480	177	0	5800050.00	Cr	Default
\.


--
-- TOC entry 3387 (class 0 OID 33390)
-- Dependencies: 220
-- Data for Name: vouchertypes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vouchertypes (samplingdateonefactor, samplingdatetwofactor, activefrom, activeto, guid, lastwhatsapptemplate, parent, mailingname, samplingmethod, samplingstronefactor, narration, enteredby, alteredby, typeofupdateactivity, objectupdateaction, requestorrule, billcreditperiod, natureofsales, taxunitname, vchprinttitle, vchprintdecl, numberingmethod, vchdevicetype, vchdeviceno, posmessageline1, posmessageline2, exciseunitname, vchprintaddldecl, lbtdeclaration, posreturntype, vchprintjurisdiction, vchprintbankname, excisebookname, isuseforexcise, vchprinttitlenative, vchprintdeclnative, defaultgstregistration, defaultexciseregistration, defaultstregistration, vatinvoiceformat, contracontra, paymentcontra, receiptcontra, journalcontra, cnotecontra, dnotecontra, salescontra, purchasecontra, creditcstctr, debitcstctr, previouspurchase, previoussales, previousgodown, prevnarration, lastnumber, lastvchnumseries, lastgsttaxunit, usezeroentries, isupdatingtargetid, isdeleted, issecurityonwhenentered, asoriginal, isdeemedpositive, affectsstock, isactive, preventduplicates, prefillzero, printaftersave, formalreceipt, isoptional, asmfgjrnl, effectivedate, commonnarration, multinarration, istaxinvoice, getpymtlinkaftersave, useforposinvoice, useforexcisetraderinvoice, useforexcise, useforjobwork, isforjobworkin, allowconsumption, useforexcisegoods, useforexcisesupplementary, isdefaultallocenabled, trackaddlcost, diffactqty, discappl, isewayapplicable, generateewaybillaftersave, excludeewaybillforupload, printbookno, showdeletedvchnum, allowmultipletaxunitsperseries, whatsappaftersave, samplingnumonefactor, samplingnumtwofactor, errkey, sortposition, alterid, beginningnumber, widthofnumber, samplingamtonefactor, samplingamttwofactor, updateddatetime, tempnumberingmethod, tempnumberingsubmethod, languagenamelist, auditdetailslist, excisetariffdetailslist, prefixlistlist, suffixlistlist, restartfromlistlist, voucherclasslistlist, productcodedetailslist, vchnumseriesidlist, vouchernumberserieslist) FROM stdin;
				667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-00000037		Attendance	Attd											 Primary			Automatic					 Primary																															Yes	No	No	No	Yes	Yes	No	Yes	No	No	No	No	No	No	No	Yes	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	0	0	0	 240	 1140	 1	0			000000000			Attendance 1033					20180401Yearly 1			Default_AttendanceNo	DefaultAutomaticAuto RenumberNoNoNoNo 10 31920180401Yearly 1
				667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-00000020		Contra	Ctra											 Primary			Manual					 Primary						 Primary	No																				cash withdraw for accounts settlement	23	Default_Contra		Yes	No	No	No	Yes	No	No	Yes	No	No	No	No	No	No	No	Yes	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	0	0	0	 10	 1142	 1	0			000000000			Contra 1033					20180401Yearly 120180401 13			Default_ContraNo	DefaultManualDefaultNoNoNoNo00 29620180401Yearly 1
				667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-00000024		Credit Note	C/Note											 Primary			Manual					 Primary						 Primary	No																								Yes	No	No	No	Yes	No	No	Yes	No	No	No	No	No	No	No	Yes	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	0	0	0	 50	 1144	 1	0			000000000			Credit Note 1033					20180401Yearly 1			Default_Credit NoteNo	DefaultManualDefaultNoNoNoNo00 30020180401Yearly 1
				667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-00000025		Debit Note	D/Note											 Primary			Automatic					 Primary																															Yes	No	No	No	Yes	Yes	No	Yes	No	No	No	No	No	No	No	Yes	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	0	0	0	 60	 1146	 1	0			000000000			Debit Note 1033					20180401Yearly 1			Default_Debit NoteNo	DefaultAutomaticAuto RenumberNoNoNoNo 10 30120180401Yearly 1
				667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-00000028		Delivery Note	Dely Note											 Primary			Automatic					 Primary																															Yes	No	No	No	Yes	No	Yes	No	No	No	No	No	No	No	No	Yes	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	0	0	0	 90	 1148	 1	0			000000000			Delivery Note 1033					20180401Yearly 1			Default_Delivery NoteNo	DefaultAutomaticAuto RenumberNoNoNoNo 10 30420180401Yearly 1
				667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-00000039		Job Work In Order	Job Wrk In Ordr											 Primary			Automatic					 Primary																															Yes	No	No	No	Yes	Yes	No	Yes	No	No	No	No	No	No	No	Yes	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	0	0	0	 260	 1150	 1	0			000000000			Job Work In Order 1033					20180401Yearly 1			Default_Job Work In OrderNo	DefaultAutomaticAuto RenumberNoNoNoNo 10 32120180401Yearly 1
				667653ae-9a3a-48fa-94ee-ee5e6c0c80b8-0000003a		Job Work Out Order	Job Wrk Out Ordr											 Primary			Automatic					 Primary																															Yes	No	No	No	Yes	No	No	Yes	No	No	No	No	No	No	No	Yes	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	No	0	0	0	 270	 1152	 1	0			000000000			Job Work Out Order 1033					20180401Yearly 1			Default_Job Work Out OrderNo	DefaultAutomaticAuto RenumberNoNoNoNo 10 32220180401Yearly 1
\.


--
-- TOC entry 3236 (class 2606 OID 33021)
-- Name: query_cache query_cache_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.query_cache
    ADD CONSTRAINT query_cache_pkey PRIMARY KEY (id);


--
-- TOC entry 3238 (class 2606 OID 33023)
-- Name: query_cache query_cache_prompt_hash_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.query_cache
    ADD CONSTRAINT query_cache_prompt_hash_key UNIQUE (prompt_hash);


-- Completed on 2025-07-04 12:13:22

--
-- PostgreSQL database dump complete
--

