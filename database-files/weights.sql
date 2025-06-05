USE openport_database;

CREATE TABLE Weights(
   geo_Austria                                VARCHAR(18) NOT NULL
  ,geo_Belgium                                VARCHAR(18) NOT NULL
  ,geo_Bulgaria                               VARCHAR(19) NOT NULL
  ,geo_Croatia                                VARCHAR(18) NOT NULL
  ,geo_Cyprus                                 VARCHAR(18) NOT NULL
  ,geo_Czechia                                VARCHAR(19) NOT NULL
  ,geo_Denmark                                VARCHAR(19) NOT NULL
  ,geo_Estonia                                VARCHAR(19) NOT NULL
  ,geo_Finland                                VARCHAR(18) NOT NULL
  ,geo_France                                 VARCHAR(18) NOT NULL
  ,geo_Germany                                VARCHAR(19) NOT NULL
  ,geo_Greece                                 VARCHAR(19) NOT NULL
  ,geo_Hungary                                VARCHAR(19) NOT NULL
  ,geo_Iceland                                VARCHAR(18) NOT NULL
  ,geo_Ireland                                VARCHAR(19) NOT NULL
  ,geo_Italy                                  VARCHAR(18) NOT NULL
  ,geo_Latvia                                 VARCHAR(18) NOT NULL
  ,geo_Liechtenstein                          VARCHAR(19) NOT NULL
  ,geo_Lithuania                              VARCHAR(20) NOT NULL
  ,geo_Luxembourg                             VARCHAR(19) NOT NULL
  ,geo_Malta                                  VARCHAR(19) NOT NULL
  ,geo_Montenegro                             VARCHAR(19) NOT NULL
  ,geo_Netherlands                            VARCHAR(17) NOT NULL
  ,geo_Norway                                 VARCHAR(18) NOT NULL
  ,geo_Poland                                 VARCHAR(20) NOT NULL
  ,geo_Portugal                               VARCHAR(18) NOT NULL
  ,geo_Romania                                VARCHAR(21) NOT NULL
  ,geo_Slovakia                               VARCHAR(20) NOT NULL
  ,geo_Slovenia                               VARCHAR(18) NOT NULL
  ,geo_Spain                                  VARCHAR(18) NOT NULL
  ,geo_Sweden                                 VARCHAR(19) NOT NULL
  ,geo_Switzerland                            VARCHAR(19) NOT NULL
  ,`age_65 years or over`                   VARCHAR(18) NOT NULL
  ,`age_From 14 to 17 years`                  VARCHAR(19) NOT NULL
  ,`age_From 18 to 34 years`                VARCHAR(19) NOT NULL
  ,`age_From 35 to 64 years`                  VARCHAR(19) NOT NULL
  ,`age_Less than 14 years`                   VARCHAR(19) NOT NULL
  ,`age_Less than 18 years`                   VARCHAR(18) NOT NULL
  ,age_Unknown                                VARCHAR(18) NOT NULL
  ,sex_Females                                VARCHAR(18) NOT NULL
  ,sex_Males                                  VARCHAR(19) NOT NULL
  ,sex_Unknown                                VARCHAR(19) NOT NULL
  ,citizen_Afghanistan                        VARCHAR(20) NOT NULL
  ,citizen_Albania                            VARCHAR(17) NOT NULL
  ,citizen_Algeria                            VARCHAR(19) NOT NULL
  ,citizen_Angola                             VARCHAR(19) NOT NULL
  ,citizen_Argentina                          VARCHAR(19) NOT NULL
  ,citizen_Armenia                            VARCHAR(19) NOT NULL
  ,citizen_Azerbaijan                         VARCHAR(19) NOT NULL
  ,citizen_Bahrain                            VARCHAR(19) NOT NULL
  ,citizen_Bangladesh                         VARCHAR(17) NOT NULL
  ,citizen_Belarus                            VARCHAR(19) NOT NULL
  ,citizen_Benin                              VARCHAR(16) NOT NULL
  ,citizen_Bhutan                             VARCHAR(19) NOT NULL
  ,citizen_Bolivia                            VARCHAR(18) NOT NULL
  ,`citizen_Bosnia and Herzegovina`           VARCHAR(19) NOT NULL
  ,citizen_Botswana                           VARCHAR(18) NOT NULL
  ,citizen_Brazil                             VARCHAR(19) NOT NULL
  ,`citizen_Burkina Faso`                     VARCHAR(19) NOT NULL
  ,citizen_Burundi                            VARCHAR(18) NOT NULL
  ,`citizen_Cabo Verde`                       VARCHAR(17) NOT NULL
  ,citizen_Cambodia                           VARCHAR(18) NOT NULL
  ,citizen_Cameroon                           VARCHAR(19) NOT NULL
  ,`citizen_Central African Republic`         VARCHAR(18) NOT NULL
  ,citizen_Chad                               VARCHAR(17) NOT NULL
  ,citizen_Chile                              VARCHAR(18) NOT NULL
  ,citizen_China                              VARCHAR(19) NOT NULL
  ,citizen_Colombia                           VARCHAR(18) NOT NULL
  ,citizen_Comoros                            VARCHAR(19) NOT NULL
  ,citizen_Congo                              VARCHAR(19) NOT NULL
  ,`citizen_Costa Rica`                       VARCHAR(19) NOT NULL
  ,citizen_Cuba                               VARCHAR(18) NOT NULL
  ,`citizen_Côte d’Ivoire`                    VARCHAR(19) NOT NULL
  ,`citizen_Democratic Republic of the Congo` VARCHAR(19) NOT NULL
  ,citizen_Djibouti                           VARCHAR(16) NOT NULL
  ,citizen_Dominica                           VARCHAR(18) NOT NULL
  ,`citizen_Dominican Republic`               VARCHAR(18) NOT NULL
  ,citizen_Ecuador                            VARCHAR(20) NOT NULL
  ,citizen_Egypt                              VARCHAR(19) NOT NULL
  ,`citizen_El Salvador`                      VARCHAR(20) NOT NULL
  ,`citizen_Equatorial Guinea`                VARCHAR(19) NOT NULL
  ,citizen_Eritrea                            VARCHAR(18) NOT NULL
  ,citizen_Eswatini                           VARCHAR(18) NOT NULL
  ,citizen_Ethiopia                           VARCHAR(17) NOT NULL
  ,citizen_Gabon                              VARCHAR(18) NOT NULL
  ,citizen_Gambia                             VARCHAR(19) NOT NULL
  ,The                                        VARCHAR(19) NOT NULL
  ,citizen_Georgia                            VARCHAR(17) NOT NULL
  ,citizen_Ghana                              VARCHAR(19) NOT NULL
  ,citizen_Guatemala                          VARCHAR(19) NOT NULL
  ,citizen_Guinea                             VARCHAR(18) NOT NULL
  ,citizen_GuineaBissau                       VARCHAR(20) NOT NULL
  ,citizen_Guyana                             VARCHAR(18) NOT NULL
  ,citizen_Haiti                              VARCHAR(17) NOT NULL
  ,citizen_Honduras                           VARCHAR(19) NOT NULL
  ,citizen_India                              VARCHAR(18) NOT NULL
  ,citizen_Indonesia                          VARCHAR(19) NOT NULL
  ,citizen_Iran                               VARCHAR(17) NOT NULL
  ,citizen_Iraq                               VARCHAR(18) NOT NULL
  ,citizen_Israel                             VARCHAR(18) NOT NULL
  ,citizen_Jamaica                            VARCHAR(16) NOT NULL
  ,citizen_Jordan                             VARCHAR(20) NOT NULL
  ,citizen_Kazakhstan                         VARCHAR(20) NOT NULL
  ,citizen_Kenya                              VARCHAR(20) NOT NULL
  ,citizen_Kosovo                             VARCHAR(19) NOT NULL
  ,citizen_Kuwait                             VARCHAR(18) NOT NULL
  ,citizen_Kyrgyzstan                         VARCHAR(18) NOT NULL
  ,citizen_Laos                               VARCHAR(18) NOT NULL
  ,citizen_Lebanon                            VARCHAR(20) NOT NULL
  ,citizen_Liberia                            VARCHAR(20) NOT NULL
  ,citizen_Libya                              VARCHAR(18) NOT NULL
  ,citizen_Liechtenstein                      VARCHAR(16) NOT NULL
  ,citizen_Madagascar                         VARCHAR(19) NOT NULL
  ,citizen_Malawi                             VARCHAR(20) NOT NULL
  ,citizen_Malaysia                           VARCHAR(18) NOT NULL
  ,citizen_Mali                               VARCHAR(18) NOT NULL
  ,citizen_Mauritania                         VARCHAR(18) NOT NULL
  ,citizen_Mauritius                          VARCHAR(18) NOT NULL
  ,citizen_Mexico                             VARCHAR(19) NOT NULL
  ,citizen_Moldova                            VARCHAR(18) NOT NULL
  ,citizen_Mongolia                           VARCHAR(19) NOT NULL
  ,citizen_Montenegro                         VARCHAR(19) NOT NULL
  ,citizen_Morocco                            VARCHAR(19) NOT NULL
  ,citizen_Mozambique                         VARCHAR(17) NOT NULL
  ,citizen_MyanmarBurma                       VARCHAR(17) NOT NULL
  ,citizen_Namibia                            VARCHAR(19) NOT NULL
  ,citizen_Nepal                              VARCHAR(19) NOT NULL
  ,citizen_Nicaragua                          VARCHAR(18) NOT NULL
  ,citizen_Niger                              VARCHAR(17) NOT NULL
  ,citizen_Nigeria                            VARCHAR(19) NOT NULL
  ,`citizen_North Korea`                      VARCHAR(17) NOT NULL
  ,`citizen_North Macedonia`                  VARCHAR(19) NOT NULL
  ,citizen_Pakistan                           VARCHAR(20) NOT NULL
  ,citizen_Palestine                          VARCHAR(18) NOT NULL
  ,citizen_Panama                             VARCHAR(19) NOT NULL
  ,citizen_Paraguay                           VARCHAR(19) NOT NULL
  ,citizen_Peru                               VARCHAR(19) NOT NULL
  ,citizen_Philippines                        VARCHAR(20) NOT NULL
  ,citizen_Russia                             VARCHAR(18) NOT NULL
  ,citizen_Rwanda                             VARCHAR(18) NOT NULL
  ,`citizen_Saint Lucia`                      VARCHAR(18) NOT NULL
  ,`citizen_Saudi Arabia`                     VARCHAR(17) NOT NULL
  ,citizen_Senegal                            VARCHAR(18) NOT NULL
  ,citizen_Serbia                             VARCHAR(19) NOT NULL
  ,`citizen_Sierra Leone`                     VARCHAR(19) NOT NULL
  ,citizen_Singapore                          VARCHAR(19) NOT NULL
  ,citizen_Somalia                            VARCHAR(18) NOT NULL
  ,`citizen_South Africa`                     VARCHAR(19) NOT NULL
  ,`citizen_South Korea`                      VARCHAR(19) NOT NULL
  ,`citizen_South Sudan`                      VARCHAR(17) NOT NULL
  ,`citizen_Sri Lanka`                        VARCHAR(20) NOT NULL
  ,citizen_Stateless                          VARCHAR(17) NOT NULL
  ,citizen_Sudan                              VARCHAR(18) NOT NULL
  ,citizen_Suriname                           VARCHAR(19) NOT NULL
  ,citizen_Syria                              VARCHAR(18) NOT NULL
  ,citizen_Taiwan                             VARCHAR(19) NOT NULL
  ,citizen_Tajikistan                         VARCHAR(20) NOT NULL
  ,citizen_Tanzania                           VARCHAR(19) NOT NULL
  ,citizen_Thailand                           VARCHAR(19) NOT NULL
  ,citizen_TimorLeste                         VARCHAR(19) NOT NULL
  ,citizen_Togo                               VARCHAR(20) NOT NULL
  ,citizen_Total                              VARCHAR(17) NOT NULL
  ,`citizen_Trinidad and Tobago`              VARCHAR(18) NOT NULL
  ,citizen_Tunisia                            VARCHAR(18) NOT NULL
  ,citizen_Turkmenistan                       VARCHAR(18) NOT NULL
  ,citizen_Turkiye                            VARCHAR(17) NOT NULL
  ,citizen_Uganda                             VARCHAR(18) NOT NULL
  ,citizen_Ukraine                            VARCHAR(17) NOT NULL
  ,citizen_Unknown                            VARCHAR(18) NOT NULL
  ,citizen_Uruguay                            VARCHAR(19) NOT NULL
  ,citizen_Uzbekistan                         VARCHAR(19) NOT NULL
  ,citizen_Venezuela                          VARCHAR(17) NOT NULL
  ,`citizen_Viet Nam`                         VARCHAR(19) NOT NULL
  ,`citizen_Western Sahara`                   VARCHAR(19) NOT NULL
  ,citizen_Yemen                              VARCHAR(17) NOT NULL
  ,citizen_Zimbabwe                           VARCHAR(20) NOT NULL
);
INSERT INTO Weights(geo_Austria,geo_Belgium,geo_Bulgaria,geo_Croatia,geo_Cyprus,geo_Czechia,geo_Denmark,geo_Estonia,geo_Finland,geo_France,geo_Germany,geo_Greece,geo_Hungary,geo_Iceland,geo_Ireland,geo_Italy,geo_Latvia,geo_Liechtenstein,geo_Lithuania,geo_Luxembourg,geo_Malta,geo_Montenegro,geo_Netherlands,geo_Norway,geo_Poland,geo_Portugal,geo_Romania,geo_Slovakia,geo_Slovenia,geo_Spain,geo_Sweden,geo_Switzerland,`age_65 years or over`,`age_From 14 to 17 years`,`age_From 18 to 34 years`,`age_From 35 to 64 years`,`age_Less than 14 years`,`age_Less than 18 years`,age_Unknown,sex_Females,sex_Males,sex_Unknown,citizen_Afghanistan,citizen_Albania,citizen_Algeria,citizen_Angola,citizen_Argentina,citizen_Armenia,citizen_Azerbaijan,citizen_Bahrain,citizen_Bangladesh,citizen_Belarus,citizen_Benin,citizen_Bhutan,citizen_Bolivia,`citizen_Bosnia and Herzegovina`,citizen_Botswana,citizen_Brazil,`citizen_Burkina Faso`,citizen_Burundi,`citizen_Cabo Verde`,citizen_Cambodia,citizen_Cameroon,`citizen_Central African Republic`,citizen_Chad,citizen_Chile,citizen_China,citizen_Colombia,citizen_Comoros,citizen_Congo,`citizen_Costa Rica`,citizen_Cuba,`citizen_Côte d’Ivoire`,`citizen_Democratic Republic of the Congo`,citizen_Djibouti,citizen_Dominica,`citizen_Dominican Republic`,citizen_Ecuador,citizen_Egypt,`citizen_El Salvador`,`citizen_Equatorial Guinea`,citizen_Eritrea,citizen_Eswatini,citizen_Ethiopia,citizen_Gabon,citizen_Gambia,The,citizen_Georgia,citizen_Ghana,citizen_Guatemala,citizen_Guinea,citizen_GuineaBissau,citizen_Guyana,citizen_Haiti,citizen_Honduras,citizen_India,citizen_Indonesia,citizen_Iran,citizen_Iraq,citizen_Israel,citizen_Jamaica,citizen_Jordan,citizen_Kazakhstan,citizen_Kenya,citizen_Kosovo,citizen_Kuwait,citizen_Kyrgyzstan,citizen_Laos,citizen_Lebanon,citizen_Liberia,citizen_Libya,citizen_Liechtenstein,citizen_Madagascar,citizen_Malawi,citizen_Malaysia,citizen_Mali,citizen_Mauritania,citizen_Mauritius,citizen_Mexico,citizen_Moldova,citizen_Mongolia,citizen_Montenegro,citizen_Morocco,citizen_Mozambique,citizen_MyanmarBurma,citizen_Namibia,citizen_Nepal,citizen_Nicaragua,citizen_Niger,citizen_Nigeria,`citizen_North Korea`,`citizen_North Macedonia`,citizen_Pakistan,citizen_Palestine,citizen_Panama,citizen_Paraguay,citizen_Peru,citizen_Philippines,citizen_Russia,citizen_Rwanda,`citizen_Saint Lucia`,`citizen_Saudi Arabia`,citizen_Senegal,citizen_Serbia,`citizen_Sierra Leone`,citizen_Singapore,citizen_Somalia,`citizen_South Africa`,`citizen_South Korea`,`citizen_South Sudan`,`citizen_Sri Lanka`,citizen_Stateless,citizen_Sudan,citizen_Suriname,citizen_Syria,citizen_Taiwan,citizen_Tajikistan,citizen_Tanzania,citizen_Thailand,citizen_TimorLeste,citizen_Togo,citizen_Total,`citizen_Trinidad and Tobago`,citizen_Tunisia,citizen_Turkmenistan,citizen_Turkiye,citizen_Uganda,citizen_Ukraine,citizen_Unknown,citizen_Uruguay,citizen_Uzbekistan,citizen_Venezuela,`citizen_Viet Nam`,`citizen_Western Sahara`,citizen_Yemen,citizen_Zimbabwe) VALUES ('0.5994842653531801','0.5431024143313642','-0.7871861607709641','0.1598491315516498','-2.236799858577446','-0.8016602151591109','-0.6714063434312005','-1.4801659068787285','0.9949523630517534','0.2921234831926123','-0.5054719929394045','-0.8480723382011769','0.03269256762865841','1.0271837906722698','-1.0519860235427878','3.4652683039696885','1.8535520546910473','-0.6087511523272132','-0.04379635830043051','-1.0548335373062536','-0.7606140003067549','-2.0463409339872136','2.326136342338253','0.2407902045306807','-0.27825980971632275','0.0846631727823075','-0.025449134022472054','-0.39682711631035705','0.5020468139991954','0.9741464105943264','0.41582242619634013','-1.8568019082507474','0.8571550619334788','-0.1428825994567217','0.16493471039974628','-0.7394829743538498','-0.7747448582827099','0.2389652186668229','0.2410309265121708','0.5841617277688432','-1.0146525498966563','-1.5788294166911636','-0.16930237352566513','3.027965929377303','-1.8455005325293075','-0.8945227373760509','-0.6308208119034264','-1.3633020612673337','-1.6796985426191215','-0.7050578016118133','3.579650315649062','-0.6764737474731628','1.43747621383959','-0.8400572837314431','2.1262168102643724','-1.5693263602838645','-0.765476404987416','0.37123586146024723','-1.5046124984463967','1.3296644359319847','1.368735792355668','-2.352423344528027','-0.9398959993280971','0.5268445648042437','1.840838734932478','0.8326556750039299','-0.7927404803434085','1.2801678354676063','-0.9733284281305152','-0.9364208640066708','0.45702013918973083','0.2336878042525119','-0.9198510442218213','0.23989716039179113','0.53963868769211','0.8511341763034332','1.1017629966461717','-0.49902064720853434','-1.2433872760805391','-0.16179561838500442','-0.2558952917558787','0.8684270825330602','3.1115190642766053','1.641041187717606','1.6143669420501192','-0.3477641986342038','0.10212692288956432','-2.12015331627648','-0.6714595545440131','-0.2473121594138951','0.6077793391656483','-0.32720740460640907','0.7045834064094099','1.651056081947805','0.09723972316462043','-1.698077677585138','-0.9701408031352033','1.449273603692279','0.6915112570876406','-4.196739927488142','2.50404046249272','-0.11649174105168839','-0.20178883272333714','-0.23819496069295665','-1.0939947244789159','1.0296354871955902','-1.599031234795847','-2.353762911504798','-0.36436393480573687','-0.04921057167970487','1.2004644273977378','1.03878470232119','-0.6138496518490374','-0.46501097044446627','0.7824113457605307','1.2723052230522536','0.3956276974934333','0.1493867662710953','-0.4707367508099323','-2.319057907751055','-0.4543913427097144','-1.4083021196872558','-0.9164440644726202','-1.80605913486538','3.251438181396717','-2.7641531259444143','-2.4532844426036746','0.7917518335530587','0.541635132389899','-0.5321229614049022','2.979385744077328','-1.3811094772095485','0.022270852815966385','2.7794426345837464','-0.3854721224348804','-1.7127201302806039','-1.4220618251057309','-0.34288856179834615','0.6002116422877339','0.9057991000208955','-2.996378859356516','2.521539716761053','-0.458159771446254','-0.9100300844832044','0.20242243764695622','-0.9860780821947955','2.1564612897874613','0.03704726445231784','-1.6058468094289209','2.503430535430984','-0.34363751109147556','2.555421815106622','2.6822776961770214','-1.7554736494863687','3.4049305201261775','-1.8229504177659066','-0.07151066444052928','-1.1459629669363371','-1.9259291398669434','-0.6287565926065699','-0.18718031950878122','1.562679213549677','1.4434421844557561','-1.697808653550929','1.6691053652660706','1.117917804687476','1.1425064700796188','1.566116953179322','1.1659893986286949','-3.3176245671870745','-1.2445114715783234','0.584474184237006','-1.7142972526610514','0.14771816394590676','3.588977688526505','-0.35783865101689116');
