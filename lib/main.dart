import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:haber_app/core/utils/constants/colors/color_constants.dart';
import 'package:haber_app/models/base_model_abstract_class.dart';
import 'package:haber_app/models/news_load_data.dart';
import 'package:haber_app/models/news_ticker_load_data.dart';
import 'package:haber_app/models/videos_load_data.dart';
import 'package:haber_app/services/news_services.dart';
import 'package:haber_app/services/news_ticker_services.dart';
import 'package:haber_app/services/videos_services.dart';
import 'package:haber_app/views/multi_widgets/b_cards.widget.dart';
import 'package:haber_app/views/multi_widgets/c_cards_widget.dart';
import 'package:haber_app/views/multi_widgets/d_texts_widget.dart';
import 'package:haber_app/views/multi_widgets/f_cards.widgets.dart';
import 'package:haber_app/views/widgets/a_card_widget.dart';
import 'package:haber_app/views/widgets/news_ticker_widget.dart';
import 'package:haber_app/views/widgets/videoplayer_widget.dart';
import 'package:video_player/video_player.dart';

Future<void> main() async {
  await initializeDateFormatting('tr_TR');
  runApp(const HaberApp());
}

class HaberApp extends StatelessWidget {
  const HaberApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Haber App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(title: "HAPP"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late VideoPlayerController controller;
  @override
  void initState() {
    super.initState();
  }

  //BaseModele bir liste tanımlandı. newsData ve videoData değişkenlerine fetch edilen resultlar atandı.
  //İki API tek futurebuilder ve listviewbuilderda işleneceği için tek bir future oluşuturuldu.
  Future<List<BaseModel>> _initData() async {
    final newsData = await NewsServices.fetchNews();
    final videoData = await VideoServices.fetchVideo();
    final newsTickerData = await NewsTickerServices.fetchNewsTicker();
    return [newsData, videoData, newsTickerData];
  }

  @override
  Widget build(BuildContext context) {
    const double spacing = 15.0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.instance.turkuaz,
        title: const Center(child: Text('HAPP')),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          return Future<void>.delayed(const Duration(seconds: 3));
        },
        child: Center(
          child: Container(
            constraints: const BoxConstraints(
                minHeight: 100, minWidth: 670, maxWidth: 700),
            child: Column(
              children: <Widget>[
                FutureBuilder(
                    //Futurebuilder asenkron olan API çağrısı gerçekleştirilir.
                    future:
                        _initData(), //initData future nesnesi ile result beklenir.
                    builder: (context, snapshot) {
                      //Widgetlar dinamikleştirilir.
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // Veriler henüz yüklenmediyse, geçici bir gösterge gösterir.
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        // Veriler yüklenirken hata oluştuysa, hatayı gösterir.
                        return const Center(
                            child: Text('Veriler yüklenirken hata oluştu.'));
                      } else {
                        //snapshot.data da okunan 0. ve 1. indislerin News ve Video modelleri olup olmaduğı kontrol edildi.
                        final newsData = (snapshot.data![0] as News)
                            .data!
                            .articles!
                            .response; //News API'nin yapısında data->articles->response şeklinde ilerlenerek API'deki sonuçlar newsData değişkenine aktarıldı.
                        final newsTickersData =
                            (snapshot.data![2] as NewsTicker)
                                .data!
                                .articles!
                                .response;
                        final videoData = (snapshot.data![1] as Video)
                            .data!
                            .videos!
                            .response; //Video API'nin yapısında data->videos->response şeklinde ilerlenerek API'deki sonuçlar videoData değişkenine aktarıldı.
                        final videoUrl = videoData![0]
                            .videoUrl; //Videoplayerda kullanılacak veriler ilgili değişkenlere atandı.
                        final outputDate = videoData[0].outputDate!.toString();
                        final videoHeader = videoData[0].titleShort ??
                            videoData[0].title; //Yoksa title kullanıldı.
                        final videoSpot = videoData[0].spot;
                        return snapshot.hasError != true
                            ? Expanded(
                                child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  //Koşullar sağlanıp tanımlamalar gerçekleştirildikten sonra ListViewBuilder döndürüldü.
                                  itemCount:
                                      1, //İndexler ile veriler sağlanıp özel itemler kullanılacağından item 1 verildi.
                                  shrinkWrap:
                                      true, //Listview boyutu çocuklara uygun olacak şekilde ayarlandı.
                                  itemBuilder: (context, index) {
                                    String date, time;
                                    date = DateFormat('dd.MM.yyyy').format(
                                        //API'den gelen outputDate verisi "dd.MM.yyyy" şeklinde formatlandı.
                                        DateFormat("EEEE dd.MM.yyyy HH:mm",
                                                'tr_TR')
                                            .parse(outputDate));
                                    time = DateFormat('HH:mm').format(DateFormat(
                                            //API'den gelen outputDate verisi "HH:mm" şeklinde formatlandı.
                                            "EEEE dd.MM.yyyy HH:mm",
                                            'tr_TR')
                                        .parse(outputDate));
                                    return Padding(
                                      padding: const EdgeInsets.all(
                                          8), //Sayfanın her yönünden 8 pixel boşluk verildi.
                                      child: Column(
                                        //Dikey hizalama yapıldı.
                                        children: [
                                          NewsTickerWidget(newsList: [
                                            //NewsTickerWidget Widget çağırıldı.
                                            newsTickersData![0].titleShort!,
                                            newsTickersData[1].titleShort!,
                                            newsTickersData[2].titleShort!,
                                          ]),
                                          Card(
                                            color:
                                                ColorConstant.instance.turkuaz,
                                            child: Row(
                                              //Yatay hizalama yapıldı.
                                              children: [
                                                ACard(
                                                  //ACard Widgetı çağırıldı.
                                                  newsData: newsData,
                                                  index: 0,
                                                ),
                                                BCards(
                                                    newsData:
                                                        newsData), //BCards Widgetı çağırıldı.
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: spacing),
                                          CCards(
                                              newsData:
                                                  newsData), //CCards Widgetı çağırıldı.
                                          const Divider(
                                              indent: 25,
                                              endIndent: 25,
                                              thickness: 2,
                                              height: 30),
                                          DTexts(
                                              newsData:
                                                  newsData), //DTexts Widgetı çağırıldı.
                                          VideoPlayerWidget(
                                              //VideoplayerWidget Widgetı çağırıldı.
                                              videoUrl: videoUrl,
                                              date: date,
                                              time: time,
                                              videoHeader: videoHeader,
                                              videoSpot: videoSpot),
                                          FCards(newsData: newsData),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              )
                            : const Center(child: CircularProgressIndicator());
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
