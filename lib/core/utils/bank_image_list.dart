class BankUtils {
  /// لیست بانک ها
  static List<Map<String, dynamic>> bankImageList = [
    {
      "name": "سایر",
      "img": "bank-sayer.png",
      "slug": '',
    },
    {
      "name": "بانک ملی",
      "img": "bank-melli.png",
      "slug": '603799',
    },
    {
      "name": "بانک ملت",
      "img": "bank-mellat.png",
      "slug": '610433,991975',
    },
    {
      "name": "ملت",
      "img": "bank-mellat.png",
      "slug": '610433,991975',
    },
    {
      "name": "بانک صادرات",
      "img": "bank-saderat.png",
      "slug": '603769',
    },
    {
      "name": "بانک تجارت",
      "img": "bank-tejarat.png",
      "slug": '627353,585983',
    },
    {
      "name": "بانک مسکن",
      "img": "bank-maskan.png",
      "slug": '628023',
    },
    {
      "name": "بانک پاسارگاد",
      "img": "bank-pasargad.png",
      "slug": '639347,502229'
    },
    {
      "name": "بانک پارسیان",
      "img": "bank-parsian.png",
      "slug": '622106,639194,627884'
    },
    {
      "name": "بانک انصار",
      "img": "bank-ansar.png",
      "slug": '627381',
    },
    {
      "name": "بانک سامان",
      "img": "bank-saman.png",
      "slug": '621986',
    },
    {
      "name": "بانک اقتصاد نوین",
      "img": "bank-eqtesadnovin.png",
      "slug": '627412'
    },
    {
      "name": "بانک شهر",
      "img": "bank-shahr.png",
      "slug": '502806,504706',
    },
    {
      "name": "بانک رفاه",
      "img": "bank-refah.png",
      "slug": '589463',
    },
    {
      "name": "بانک کشاورزی",
      "img": "bank-keshavarzi.png",
      "slug": '603770,639217'
    },
    {
      "name": "بانک سینا",
      "img": "bank-sina.png",
      "slug": '639346',
    },
    {
      "name": "بانک سپه",
      "img": "bank-sepah.png",
      "slug": '589210',
    },
    {
      "name": "موسسه قوامین",
      "img": "bank-ghavamin.png",
      "slug": '639599',
    },
    {
      "name": "بانک دی",
      "img": "bank-day.png",
      "slug": '502938',
    },
    {
      "name": "بانک آینده",
      "img": "bank-ayandeh.png",
      "slug": '636214',
    },
    {
      "name": "بانک ایران زمین",
      "img": "bank-iranzamin.png",
      "slug": '505785',
    },
    {
      "name": "بانک مهر اقتصاد",
      "img": "bank-mehreghtesad.png",
      "slug": '639370'
    },
    {
      "name": "بانک قرض الحسنه رسالت",
      "img": "bank-resalat.png",
      "slug": '504172'
    },
    {
      "name": "بانک سرمایه",
      "img": "bank-sarmaye.png",
      "slug": '639607',
    },
    {
      "name": "بانک قرض الحسنه مهر ایران",
      "img": "bank-mehriran.png",
      "slug": '606373'
    },
    {
      "name": "بانک گردشگری",
      "img": "bank-gardeshgari.png",
      "slug": '505416',
    },
    {
      "name": "موسسه مالی کوثر",
      "img": "bank-kosar.png",
      "slug": '505801',
    },
    {
      "name": "بانک توسعه و تعاون",
      "img": "bank-tosee.png",
      "slug": '502908',
    },
    {
      "name": "بانک توسعه صادرات",
      "img": "bank-toseesaderat.png",
      "slug": '627648,207177',
    },
    {
      "name": "پست بانک",
      "img": "bank-post.png",
      "slug": '627760',
    },
    {
      "name": "موسسه نور",
      "img": "bank-noor.png",
      "slug": '507677',
    },
    {
      "name": "بانک حکمت ایرانیان",
      "img": "bank-hekmatiranian.png",
      "slug": '636949',
    },
    {
      "name": "بانک خاورمیانه",
      "img": "bank-khavarmiane.png",
      "slug": '505809',
    },
    {
      "name": "بانک خاورمیانه",
      "img": "bank-khavarmiane.png",
      "slug": '585947',
    },
    {
      "name": "بانک صنعت و معدن",
      "img": "bank-sanatvamadan.png",
      "slug": '627961',
    },
    {
      "name": "بانک کارآفرین",
      "img": "bank-karafarin.png",
      "slug": '627488,502910',
    },
  ];

  /// گرفتن اسم عکس بانک
  static String getBankImageFileName(String bankName) {
    String bankImg = "";
    for (var element in bankImageList) {
      if (bankName == element["name"]) {
        bankImg = element["img"];
      }
    }
    return bankImg;
  }
}
