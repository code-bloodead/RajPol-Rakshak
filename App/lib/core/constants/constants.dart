import 'package:rakshak/data/models/home/get_incident_resp.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import '/core/app_export.dart';

List<Incident> userReports = [
  Incident(
    id: "ABCD1234",
    image:
        "https://st3.depositphotos.com/23594922/31822/v/450/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg",
    title: "IncidentA0",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
    type: "Crime",
    station_name: "Andheri",
    location: "Chakala street",
    source: "9324326404",
    status: "Closed",
    created_at: "2024-01-11T00:21:12.102+00:00",
  ),
  Incident(
    id: "ABCB1234",
    image:
        "https://st3.depositphotos.com/23594922/31822/v/450/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg",
    title: "IncidentA99",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
    type: "Crime",
    station_name: "Andheri",
    location: "Chakala street",
    source: "9324326404",
    status: "Closed",
    created_at: "2024-01-15T00:21:12.102+00:00",
  ),
  Incident(
    id: "BBCB1234",
    image:
        "https://st3.depositphotos.com/23594922/31822/v/450/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg",
    title: "IncidentA98",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
    type: "Crime",
    station_name: "Andheri",
    location: "Chakala street",
    source: "CCTV",
    status: "Closed",
    created_at: "2024-01-15T00:21:12.102+00:00",
  ),
  Incident(
    id: "DBCB1234",
    image:
        "https://st3.depositphotos.com/23594922/31822/v/450/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg",
    title: "IncidentA88",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
    type: "Crime",
    station_name: "Andheri",
    location: "Chakala street",
    source: "CCTV",
    status: "Closed",
    created_at: "2024-01-15T00:21:12.102+00:00",
  ),
  Incident(
    id: "EFGH5678",
    image:
        "https://st3.depositphotos.com/23594922/31822/v/450/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg",
    title: "IncidentB1",
    description: "Incident1",
    type: "Robbery",
    station_name: "Colaba",
    location: "Gateway of India",
    source: "CCTV",
    status: "Pending",
    created_at: "2024-01-12T08:45:30.512+00:00",
  ),
  Incident(
    id: "IJKL9012",
    image:
        "https://st3.depositphotos.com/23594922/31822/v/450/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg",
    title: "IncidentC2",
    description: "Incident2",
    type: "Assault",
    station_name: "Bandra",
    location: "Linking Road",
    source: "9324326404",
    status: "Resolved",
    created_at: "2024-01-12T14:10:05.721+00:00",
  ),
  Incident(
    id: "MNOP3456",
    image:
        "https://st3.depositphotos.com/23594922/31822/v/450/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg",
    title: "IncidentD3",
    description: "Incident3",
    type: "Vandalism",
    station_name: "Dadar",
    location: "Shivaji Park",
    source: "CCTV",
    status: "Pending",
    created_at: "2024-01-13T18:30:40.901+00:00",
  ),
  Incident(
    id: "QRST7890",
    image:
        "https://st3.depositphotos.com/23594922/31822/v/450/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg",
    title: "IncidentE4",
    description: "Incident4",
    type: "Missing Person",
    station_name: "Worli",
    location: "Sea Face",
    source: "9324326404",
    status: "Open",
    created_at: "2024-01-14T09:15:22.623+00:00",
  ),
  Incident(
    id: "UVWX1234",
    image:
        "https://st3.depositphotos.com/23594922/31822/v/450/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg",
    title: "IncidentF5",
    description: "Incident5",
    type: "Traffic Violation",
    station_name: "Vile Parle",
    location: "Western Express Highway",
    source: "CCTV",
    status: "Closed",
    created_at: "2024-01-15T12:45:55.321+00:00",
  ),
  Incident(
    id: "YZAB5678",
    image:
        "https://st3.depositphotos.com/23594922/31822/v/450/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg",
    title: "IncidentG6",
    description: "Incident6",
    type: "Fire",
    station_name: "Mumbai Central",
    location: "Local Market",
    source: "9324326404",
    status: "Resolved",
    created_at: "2024-01-04T16:20:30.430+00:00",
  ),
  Incident(
    id: "CDEF9012",
    image:
        "https://st3.depositphotos.com/23594922/31822/v/450/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg",
    title: "IncidentHZ",
    description: "Incident7",
    type: "Suspicious Activity",
    station_name: "Fort",
    location: "CST Station",
    source: "9324326404",
    status: "Pending",
    created_at: "2024-01-15T21:05:15.812+00:00",
  ),
  Incident(
    id: "CDEF9013",
    image:
        "https://st3.depositphotos.com/23594922/31822/v/450/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg",
    title: "IncidentHA",
    description: "Incident7",
    type: "Suspicious Activity",
    station_name: "Fort",
    location: "CST Station",
    source: "9324326404",
    status: "Pending",
    created_at: "2024-01-10T21:05:15.812+00:00",
  ),
  Incident(
    id: "CDEF9000",
    image:
        "https://st3.depositphotos.com/23594922/31822/v/450/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg",
    title: "IncidentGH7",
    description: "Incident7",
    type: "Suspicious Activity",
    station_name: "Fort",
    location: "CST Station",
    source: "User Report",
    status: "Pending",
    created_at: "2024-01-10T21:05:15.812+00:00",
  ),
  Incident(
    id: "CDEF7000",
    image:
        "https://st3.depositphotos.com/23594922/31822/v/450/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg",
    title: "Incident37",
    description: "Incident7",
    type: "Suspicious Activity",
    station_name: "Fort",
    location: "CST Station",
    source: "User Report",
    status: "Pending",
    created_at: "2024-01-09T21:05:15.812+00:00",
  ),
  Incident(
    id: "CDEF6000",
    image:
        "https://st3.depositphotos.com/23594922/31822/v/450/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg",
    title: "Incident67",
    description: "Incident7",
    type: "Suspicious Activity",
    station_name: "Fort",
    location: "CST Station",
    source: "9324326404",
    status: "Pending",
    created_at: "2024-01-09T21:05:15.812+00:00",
  ),
  Incident(
    id: "CDEF5000",
    image:
        "https://st3.depositphotos.com/23594922/31822/v/450/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg",
    title: "IncidentHA",
    description: "Incident7",
    type: "Suspicious Activity",
    station_name: "Fort",
    location: "CST Station",
    source: "9324326404",
    status: "Pending",
    created_at: "2024-01-08T21:05:15.812+00:00",
  ),
  Incident(
    id: "CAEF5000",
    image:
        "https://st3.depositphotos.com/23594922/31822/v/450/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg",
    title: "IncidentHH",
    description: "Incident7",
    type: "Suspicious Activity",
    station_name: "Fort",
    location: "CST Station",
    source: "9324326404",
    status: "Pending",
    created_at: "2024-01-07T21:05:15.812+00:00",
  ),
];

List<BarData> dataListConstants = [
  BarData(ColorConstant.blue500, 18, 18),
  BarData(ColorConstant.blue500, 17, 8),
  BarData(ColorConstant.blue500, 10, 15),
  BarData(ColorConstant.blue500, 2.5, 5),
  BarData(ColorConstant.blue500, 2, 2.5),
  BarData(ColorConstant.blue500, 2, 2),
  BarData(ColorConstant.blue500, 10, 15),
];

List<ValueItem> incidentCategoryConst = [
  ValueItem(
      label: "lbl_gambling_activity".tr, value: "lbl_gambling_activity".tr),
  ValueItem(
      label: "lbl_illegal_sale_of_liquor".tr,
      value: "lbl_illegal_sale_of_liquor".tr),
  ValueItem(
      label: "lbl_drinking_in_public_place".tr,
      value: "lbl_drinking_in_public_place".tr),
  ValueItem(label: "lbl_eve_teasing".tr, value: "lbl_eve_teasing".tr),
  ValueItem(label: "lbl_organized_crime".tr, value: "lbl_organized_crime".tr),
  ValueItem(
      label: "lbl_nuisance_at_public_place".tr,
      value: "lbl_nuisance_at_public_place".tr),
  ValueItem(label: "lbl_terrorism".tr, value: "lbl_terrorism".tr),
  ValueItem(
      label: "lbl_information_about_wanted_criminals".tr,
      value: "lbl_information_about_wanted_criminals".tr),
  ValueItem(
      label: "lbl_other_unlawful_activity".tr,
      value: "lbl_other_unlawful_activity".tr),
];

List<ValueItem> incidentDistrictConst = [
  ValueItem(label: "Ajmer", value: "Ajmer"),
  ValueItem(label: "Alwar", value: "Alwar"),
  ValueItem(label: "Anupgarh", value: "Anupgarh"),
  ValueItem(label: "ATS & SOG", value: "ATS & SOG"),
  ValueItem(label: "Balotra", value: "Balotra"),
  ValueItem(label: "Banswara", value: "Banswara"),
  ValueItem(label: "Baran", value: "Baran"),
  ValueItem(label: "Barmer", value: "Barmer"),
  ValueItem(label: "Beawar", value: "Beawar"),
  ValueItem(label: "Bharatpur", value: "Bharatpur"),
  ValueItem(label: "Bhilwara", value: "Bhilwara"),
  ValueItem(label: "Bhiwadi", value: "Bhiwadi"),
  ValueItem(label: "Bikaner", value: "Bikaner"),
  ValueItem(label: "Bundi", value: "Bundi"),
  ValueItem(label: "Chittorgarh", value: "Chittorgarh"),
  ValueItem(label: "Churu", value: "Churu"),
  ValueItem(label: "Dausa", value: "Dausa"),
  ValueItem(label: "DCP Crime", value: "DCP Crime"),
  ValueItem(label: "Deeg", value: "Deeg"),
  ValueItem(label: "Dholpur", value: "Dholpur"),
  ValueItem(label: "Didwana-Kuchaman", value: "Didwana-Kuchaman"),
  ValueItem(label: "Dudu", value: "Dudu"),
  ValueItem(label: "Dungarpur", value: "Dungarpur"),
  ValueItem(label: "Gangapur City", value: "Gangapur City"),
  ValueItem(label: "Grp Ajmer", value: "Grp Ajmer"),
  ValueItem(label: "Grp Jodhpur", value: "Grp Jodhpur"),
  ValueItem(label: "Hanumangarh", value: "Hanumangarh"),
  ValueItem(label: "Jaipur  Metro", value: "Jaipur  Metro"),
  ValueItem(label: "Jaipur East", value: "Jaipur East"),
  ValueItem(label: "Jaipur North", value: "Jaipur North"),
  ValueItem(label: "Jaipur Rural", value: "Jaipur Rural"),
  ValueItem(label: "Jaipur South", value: "Jaipur South"),
  ValueItem(label: "Jaipur West", value: "Jaipur West"),
  ValueItem(label: "Jaisalmer", value: "Jaisalmer"),
  ValueItem(label: "Jalore", value: "Jalore"),
  ValueItem(label: "Jhalawar", value: "Jhalawar"),
  ValueItem(label: "Jhunjhunu", value: "Jhunjhunu"),
  ValueItem(label: "Jodhpur East", value: "Jodhpur East"),
  ValueItem(label: "Jodhpur Rural", value: "Jodhpur Rural"),
  ValueItem(label: "Jodhpur West", value: "Jodhpur West"),
  ValueItem(label: "Karauli", value: "Karauli"),
  ValueItem(label: "Kekri", value: "Kekri"),
  ValueItem(label: "Khairthal-Tijara", value: "Khairthal-Tijara"),
  ValueItem(label: "Kota City", value: "Kota City"),
  ValueItem(label: "Kota Rural", value: "Kota Rural"),
  ValueItem(label: "Kotputali-Bahror", value: "Kotputali-Bahror"),
  ValueItem(label: "Nagaur", value: "Nagaur"),
  ValueItem(label: "Neem Ka Thana", value: "Neem Ka Thana"),
  ValueItem(label: "Pali", value: "Pali"),
  ValueItem(label: "Phalodi", value: "Phalodi"),
  ValueItem(label: "Pratapgarh", value: "Pratapgarh"),
  ValueItem(label: "Rajsamand", value: "Rajsamand"),
  ValueItem(label: "Salumber", value: "Salumber"),
  ValueItem(label: "Sanchore", value: "Sanchore"),
  ValueItem(label: "Sawai Madhopur", value: "Sawai Madhopur"),
  ValueItem(label: "Shahapura", value: "Shahapura"),
  ValueItem(label: "Sikar", value: "Sikar"),
  ValueItem(label: "Sirohi", value: "Sirohi"),
  ValueItem(label: "Sri Ganganagar", value: "Sri Ganganagar"),
  ValueItem(label: "Tonk", value: "Tonk"),
  ValueItem(label: "Udaipur", value: "Udaipur"),
];

List<ValueItem> getIncidentStationList(String district) {
  switch (district) {
    case "Ajmer":
      return ajmerStationList;
    case "Alwar":
      return alwarStationList;
    case "Anupgarh":
      return anupgarhStationList;
    case "ATS & SOG":
      return atsAndSogStationList;
    case "Balotra":
      return balotraStationList;
    case "Banswara":
      return banswaraStationList;
    case "Baran":
      return baranStationList;
    case "Barmer":
      return barmerStationList;
    case "Beawar":
      return beawarStationList;
    case "Bharatpur":
      return bharatpurStationList;
    case "Bhilwara":
      return bhilwaraStationList;
    case "Bhiwadi":
      return bhiwadiStationList;
    case "Bikaner":
      return bikanerStationList;
    case "Bundi":
      return bundiStationList;
    case "Chittorgarh":
      return chittorgarhStationList;
    case "Churu":
      return churuStationList;
    case "Dausa":
      return dausaStationList;
    case "DCP Crime":
      return dcpCrimeStationList;
    case "Deeg":
      return deegStationList;
    case "Dholpur":
      return dholpurStationList;
    case "Didwana-Kuchaman":
      return didwanaKuchamanStationList;
    case "Dudu":
      return duduStationList;
    case "Dungarpur":
      return dungarpurStationList;
    case "Gangapur City":
      return gangapurCityStationList;
    case "Grp Ajmer":
      return grpAjmerStationList;
    case "Grp Jodhpur":
      return grpJodhpurStationList;
    case "Hanumangarh":
      return hanumangarhStationList;
    case "Jaipur  Metro":
      return jaipurMetroStationList;
    case "Jaipur East":
      return jaipurEastStationList;
    case "Jaipur North":
      return jaipurNorthStationList;
    case "Jaipur Rural":
      return jaipurRuralStationList;
    case "Jaipur South":
      return jaipurSouthStationList;
    case "Jaipur West":
      return jaipurWestStationList;
    case "Jaisalmer":
      return jaisalmerStationList;
    case "Jalore":
      return jaloreStationList;
    case "Jhalawar":
      return jhalawarStationList;
    case "Jhunjhunu":
      return jhunjhunuStationList;
    case "Jodhpur East":
      return jodhpurEastStationList;
    case "Jodhpur Rural":
      return jodhpurRuralStationList;
    case "Jodhpur West":
      return jodhpurWestStationList;
    case "Karauli":
      return karauliStationList;
    case "Kekri":
      return kekriStationList;
    case "Khairthal-Tijara":
      return khairthalTijaraStationList;
    case "Kota City":
      return kotaCityStationList;
    case "Kota Rural":
      return kotaRuralStationList;
    case "Kotputali-Bahror":
      return kotputaliBahrorStationList;
    case "Nagaur":
      return nagaurStationList;
    case "Neem Ka Thana":
      return neemKaThanaStationList;
    case "Pali":
      return paliStationList;
    case "Phalodi":
      return phalodiStationList;
    case "Pratapgarh":
      return pratapgarhStationList;
    case "Rajsamand":
      return rajsamandStationList;
    case "Salumber":
      return salumberStationList;
    case "Sanchore":
      return sanchoreStationList;
    case "Sawai Madhopur":
      return sawaiMadhopurStationList;
    case "Shahapura":
      return shahapuraStationList;
    case "Sikar":
      return sikarStationList;
    case "Sirohi":
      return sirohiStationList;
    case "Sri Ganganagar":
      return sriGanganagarStationList;
    case "Tonk":
      return tonkStationList;
    case "Udaipur":
      return udaipurStationList;
    default:
      return [];
  }
}

List<ValueItem> ajmerStationList = [
  ValueItem(label: "Adarsh Nagar", value: "Adarsh Nagar"),
  ValueItem(label: "Alwar Gate", value: "Alwar Gate"),
  ValueItem(label: "Arian", value: "Arian"),
  ValueItem(label: "Bander Sindri", value: "Bander Sindri"),
  ValueItem(label: "Christianganj", value: "Christianganj"),
  ValueItem(label: "Civil Lines", value: "Civil Lines"),
  ValueItem(label: "Clock Tower", value: "Clock Tower"),
  ValueItem(label: "Cyber Thana Ajmer", value: "Cyber Thana Ajmer"),
  ValueItem(label: "Dargah", value: "Dargah"),
  ValueItem(label: "Gandhi Nagar", value: "Gandhi Nagar"),
  ValueItem(label: "Ganj", value: "Ganj"),
  ValueItem(label: "Gegal", value: "Gegal"),
  ValueItem(label: "Kishangarh", value: "Kishangarh"),
  ValueItem(label: "Kotwali Ajmer", value: "Kotwali Ajmer"),
  ValueItem(label: "Madanganj", value: "Madanganj"),
  ValueItem(label: "Mahila Ps", value: "Mahila Ps"),
  ValueItem(label: "Mangliyawas", value: "Mangliyawas"),
  ValueItem(label: "Nasirabad City", value: "Nasirabad City"),
  ValueItem(label: "Nasirabad Sadar", value: "Nasirabad Sadar"),
  ValueItem(label: "Pisangan", value: "Pisangan"),
  ValueItem(label: "Pushkar", value: "Pushkar"),
  ValueItem(label: "Ramganj", value: "Ramganj"),
  ValueItem(label: "Rupangarh", value: "Rupangarh"),
  ValueItem(label: "Shri Nagar", value: "Shri Nagar")
];
List<ValueItem> alwarStationList = [
  ValueItem(label: "Akbarpur", value: "Akbarpur"),
  ValueItem(label: "Aravali Vihar", value: "Aravali Vihar"),
  ValueItem(label: "Badoda Meo", value: "Badoda Meo"),
  ValueItem(label: "Bagad Tiraya", value: "Bagad Tiraya"),
  ValueItem(label: "Bahtu Kala", value: "Bahtu Kala"),
  ValueItem(label: "Cyber Thana Alwar", value: "Cyber Thana Alwar"),
  ValueItem(label: "Govind Garh", value: "Govind Garh"),
  ValueItem(label: "Kathumar", value: "Kathumar"),
  ValueItem(label: "Kherli", value: "Kherli"),
  ValueItem(label: "Kotwali Alwar", value: "Kotwali Alwar"),
  ValueItem(label: "Laxman Garh", value: "Laxman Garh"),
  ValueItem(label: "Mahila Thana", value: "Mahila Thana"),
  ValueItem(label: "Malakheda", value: "Malakheda"),
  ValueItem(label: "N.E.B", value: "N.E.B"),
  ValueItem(label: "Nauganwa", value: "Nauganwa"),
  ValueItem(label: "Pratap Garh", value: "Pratap Garh"),
  ValueItem(label: "Raini", value: "Raini"),
  ValueItem(label: "Rajgarh", value: "Rajgarh"),
  ValueItem(label: "Ramgarh", value: "Ramgarh"),
  ValueItem(label: "Sadar  Alwar", value: "Sadar  Alwar"),
  ValueItem(label: "Shivaji Park", value: "Shivaji Park"),
  ValueItem(label: "Tehala", value: "Tehala"),
  ValueItem(label: "Thana Gazi", value: "Thana Gazi"),
  ValueItem(label: "Udhyog Nagar", value: "Udhyog Nagar"),
  ValueItem(label: "Vaishali Nagar", value: "Vaishali Nagar"),
  ValueItem(label: "Vijay Mandir", value: "Vijay Mandir"),
];
List<ValueItem> anupgarhStationList = [
  ValueItem(label: "Anupgarh", value: "Anupgarh"),
  ValueItem(label: "Jetsar", value: "Jetsar"),
  ValueItem(label: "Muklawa", value: "Muklawa"),
  ValueItem(label: "Nai Mandigharsana", value: "Nai Mandigharsana"),
  ValueItem(label: "Raisinghnagar", value: "Raisinghnagar"),
  ValueItem(label: "Ramsinghpur", value: "Ramsinghpur"),
  ValueItem(label: "Rawla", value: "Rawla"),
  ValueItem(label: "Sameja Kothi", value: "Sameja Kothi"),
  ValueItem(label: "Shri Vijaynagar", value: "Shri Vijaynagar"),
];
List<ValueItem> atsAndSogStationList = [
  ValueItem(label: "Cyber Crime", value: "Cyber Crime"),
  ValueItem(label: "SOG", value: "SOG"),
];
List<ValueItem> balotraStationList = [
  ValueItem(label: "Baitu", value: "Baitu"),
  ValueItem(label: "Balotra", value: "Balotra"),
  ValueItem(label: "Gidan", value: "Gidan"),
  ValueItem(label: "Jasol", value: "Jasol"),
  ValueItem(label: "Kalyanpur", value: "Kalyanpur"),
  ValueItem(label: "Mandli", value: "Mandli"),
  ValueItem(label: "Pachapdra", value: "Pachapdra"),
  ValueItem(label: "Samadari", value: "Samadari"),
  ValueItem(label: "Sindhari", value: "Sindhari"),
  ValueItem(label: "Siwana", value: "Siwana"),
];
List<ValueItem> banswaraStationList = [
  ValueItem(label: "Ambapura", value: "Ambapura"),
  ValueItem(label: "Anandpuri", value: "Anandpuri"),
  ValueItem(label: "Arthuna", value: "Arthuna"),
  ValueItem(label: "Banswara", value: "Banswara"),
  ValueItem(label: "Bhungra", value: "Bhungra"),
  ValueItem(label: "Cyber Thana Banswara", value: "Cyber Thana Banswara"),
  ValueItem(label: "Danpur", value: "Danpur"),
  ValueItem(label: "Garhi", value: "Garhi"),
  ValueItem(label: "Ghatol", value: "Ghatol"),
  ValueItem(label: "Kalinjra", value: "Kalinjra"),
  ValueItem(label: "Kasarvadi", value: "Kasarvadi"),
  ValueItem(label: "Khamera", value: "Khamera"),
  ValueItem(label: "Kushalgarh", value: "Kushalgarh"),
  ValueItem(label: "Lohariya", value: "Lohariya"),
  ValueItem(label: "Mahila Thana", value: "Mahila Thana"),
  ValueItem(label: "Motagaoun", value: "Motagaoun"),
  ValueItem(label: "Patan", value: "Patan"),
  ValueItem(label: "Rajtalab", value: "Rajtalab"),
  ValueItem(label: "Sadar Banswara", value: "Sadar Banswara"),
  ValueItem(label: "Sajjangarh", value: "Sajjangarh"),
  ValueItem(label: "Sallopat", value: "Sallopat"),
];
List<ValueItem> baranStationList = [
  ValueItem(label: "Anta", value: "Anta"),
  ValueItem(label: "Atru", value: "Atru"),
  ValueItem(label: "Bavecha(Jaipla)", value: "Bavecha(Jaipla)"),
  ValueItem(label: "Bhawargarh", value: "Bhawargarh"),
  ValueItem(label: "Chabra", value: "Chabra"),
  ValueItem(label: "Chipa Barod", value: "Chipa Barod"),
  ValueItem(label: "Cyber Thana Baran", value: "Cyber Thana Baran"),
  ValueItem(label: "Harnawada", value: "Harnawada"),
  ValueItem(label: "Kasba Thana", value: "Kasba Thana"),
  ValueItem(label: "Kawai", value: "Kawai"),
  ValueItem(label: "Kelwara", value: "Kelwara"),
  ValueItem(label: "Kishanganj", value: "Kishanganj"),
  ValueItem(label: "Kotwali", value: "Kotwali"),
  ValueItem(label: "Mahila Thana Baran", value: "Mahila Thana Baran"),
  ValueItem(label: "Mali", value: "Mali"),
  ValueItem(label: "Mangrol", value: "Mangrol"),
  ValueItem(label: "Mothpur", value: "Mothpur"),
  ValueItem(label: "Nahargarh", value: "Nahargarh"),
  ValueItem(label: "Pali", value: "Pali"),
  ValueItem(label: "Sadar", value: "Sadar"),
  ValueItem(label: "Sarthal", value: "Sarthal"),
  ValueItem(label: "Seeswali", value: "Seeswali"),
  ValueItem(label: "Shahbad", value: "Shahbad"),
];
List<ValueItem> barmerStationList = [
  ValueItem(label: "Bakhasar", value: "Bakhasar"),
  ValueItem(label: "Barmer Rural", value: "Barmer Rural"),
  ValueItem(label: "Binjrad", value: "Binjrad"),
  ValueItem(label: "Chohtan", value: "Chohtan"),
  ValueItem(label: "Cyber Thana Barmer", value: "Cyber Thana Barmer"),
  ValueItem(label: "Dhanau", value: "Dhanau"),
  ValueItem(label: "Dhorimana", value: "Dhorimana"),
  ValueItem(label: "Gadra Road", value: "Gadra Road"),
  ValueItem(label: "Girab", value: "Girab"),
  ValueItem(label: "Gudamalani", value: "Gudamalani"),
  ValueItem(label: "Kotwali Barmer", value: "Kotwali Barmer"),
  ValueItem(label: "Mahila Thana", value: "Mahila Thana"),
  ValueItem(label: "Nagana", value: "Nagana"),
  ValueItem(
      label: "Rageshwari Gass Terminal", value: "Rageshwari Gass Terminal"),
  ValueItem(label: "Ramsar", value: "Ramsar"),
  ValueItem(label: "Rico Region Barmer", value: "Rico Region Barmer"),
  ValueItem(label: "Sadar Barmer", value: "Sadar Barmer"),
  ValueItem(label: "Sedwa", value: "Sedwa"),
  ValueItem(label: "Sheo", value: "Sheo"),
];
List<ValueItem> beawarStationList = [
  ValueItem(label: "Beawar Sadar", value: "Beawar Sadar"),
  ValueItem(label: "Anandpur Kalu", value: "Anandpur Kalu"),
  ValueItem(label: "Baar", value: "Baar"),
  ValueItem(label: "Badnor", value: "Badnor"),
  ValueItem(label: "Bar", value: "Bar"),
  ValueItem(label: "Beawar City", value: "Beawar City"),
  ValueItem(label: "Jaitaran", value: "Jaitaran"),
  ValueItem(label: "Jawaja", value: "Jawaja"),
  ValueItem(label: "Masuda", value: "Masuda"),
  ValueItem(label: "Raipur", value: "Raipur"),
  ValueItem(label: "Ras", value: "Ras"),
  ValueItem(label: "Saket Nagar", value: "Saket Nagar"),
  ValueItem(label: "Sendra", value: "Sendra"),
  ValueItem(label: "Todgarh", value: "Todgarh"),
  ValueItem(label: "Vijay Nagar", value: "Vijay Nagar"),
];
List<ValueItem> bharatpurStationList = [];
List<ValueItem> bhilwaraStationList = [];
List<ValueItem> bhiwadiStationList = [];
List<ValueItem> bikanerStationList = [];
List<ValueItem> bundiStationList = [];
List<ValueItem> chittorgarhStationList = [];
List<ValueItem> churuStationList = [];
List<ValueItem> dausaStationList = [];
List<ValueItem> dcpCrimeStationList = [];
List<ValueItem> deegStationList = [];
List<ValueItem> dholpurStationList = [];
List<ValueItem> didwanaKuchamanStationList = [];
List<ValueItem> duduStationList = [];
List<ValueItem> dungarpurStationList = [];
List<ValueItem> gangapurCityStationList = [];
List<ValueItem> grpAjmerStationList = [];
List<ValueItem> grpJodhpurStationList = [];
List<ValueItem> hanumangarhStationList = [];
List<ValueItem> jaipurMetroStationList = [];
List<ValueItem> jaipurEastStationList = [];
List<ValueItem> jaipurNorthStationList = [];
List<ValueItem> jaipurRuralStationList = [];
List<ValueItem> jaipurSouthStationList = [];
List<ValueItem> jaipurWestStationList = [];
List<ValueItem> jaisalmerStationList = [];
List<ValueItem> jaloreStationList = [];
List<ValueItem> jhalawarStationList = [];
List<ValueItem> jhunjhunuStationList = [];
List<ValueItem> jodhpurEastStationList = [];
List<ValueItem> jodhpurRuralStationList = [];
List<ValueItem> jodhpurWestStationList = [];
List<ValueItem> karauliStationList = [];
List<ValueItem> kekriStationList = [];
List<ValueItem> khairthalTijaraStationList = [];
List<ValueItem> kotaCityStationList = [];
List<ValueItem> kotaRuralStationList = [];
List<ValueItem> kotputaliBahrorStationList = [];
List<ValueItem> nagaurStationList = [];
List<ValueItem> neemKaThanaStationList = [];
List<ValueItem> paliStationList = [];
List<ValueItem> phalodiStationList = [];
List<ValueItem> pratapgarhStationList = [];
List<ValueItem> rajsamandStationList = [];
List<ValueItem> salumberStationList = [];
List<ValueItem> sanchoreStationList = [];
List<ValueItem> sawaiMadhopurStationList = [];
List<ValueItem> shahapuraStationList = [];
List<ValueItem> sikarStationList = [];
List<ValueItem> sirohiStationList = [];
List<ValueItem> sriGanganagarStationList = [];
List<ValueItem> tonkStationList = [];
List<ValueItem> udaipurStationList = [];
