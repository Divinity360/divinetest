import 'dart:ui' as ui;
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:tinder_cards/util/card_data.dart';

class CardFlipPage extends StatefulWidget {
  final int cardNum;

  CardFlipPage(this.cardNum);

  @override
  State<StatefulWidget> createState() => _CardFlipPageState();
}

class _CardFlipPageState extends State<CardFlipPage> {
  double scrollPercent = 0.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        home: Scaffold(
          body: Stack(fit: StackFit.expand, children: [
            Image.asset('res/dazed.png', fit: BoxFit.cover),
            ClipRRect(
              // Clip it cleanly.
              child: BackdropFilter(
                filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  color: Colors.white.withOpacity(0.1),
                  alignment: Alignment.center,
                ),
              ),
            ),
            Container(
                decoration: new BoxDecoration(
                    gradient: new LinearGradient(
                  begin: FractionalOffset(1.0, 0.03),
                  end: FractionalOffset(1.0, 1.0),
                  // Add one stop for each color. Stops should increase from 0 to 1
                  stops: [0.1, 0.5],
                  colors: [Colors.white.withOpacity(0.1), Colors.black],
                )),
                child: CustomScrollView(slivers: [
                  SliverStickyHeader.builder(
                    sticky: true,
                    builder: (context, state) => Container(
                        height: 420.0,
                        color: Colors.transparent,
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 70,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 80),
                              child: CardFlipper(
                                  cardNum: widget.cardNum,
                                  cards: cardDataList,
                                  onScroll: (double sp) {
                                    setState(() {
                                      this.scrollPercent = sp;
                                    });
                                  }),
                            ),
                            BottomBar(
                                cardCount: cardDataList.length,
                                scrollPercent: scrollPercent),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  '03',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      letterSpacing: 0.2,
                                      fontSize:
                                          150 - (state.scrollPercentage * 100),
                                      color: Colors.white,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w900),
                                ),
                              ],
                            )
                          ],
                        )),
                  ),
                  SliverStickyHeader.builder(
                      sticky: true,
                      sliver: SliverList(
                          delegate: SliverChildListDelegate([
                        Container(
                            color: Colors.black,
                            padding:
                                EdgeInsets.only(left: 40, right: 40, top: 60),
                            child: Column(children: [
                              Text(
                                'ON THE PLASTICITY OF AN ACTOR',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    letterSpacing: 0.2,
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontFamily: 'Playfair',
                                    fontWeight: FontWeight.w900),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Habitasse platea dictumst quisque sagittis purus sit amet. Bibendum arcu vitae elementum curabitur vitae nunc sed velit dignissim. Quisque non tellus orci ac. Massa eget egestas purus viverra accumsan in. Lacus luctus accumsan tortor posuere ac ut consequat semper viverra. Dolor magna eget est lorem ipsum dolor sit amet. Tortor vitae purus faucibus ornare suspendisse. Amet justo donec enim diam vulputate ut pharetra sit amet. Sed euismod nisi porta lorem. Odio euismod lacinia at quis risus. Purus gravida quis blandit turpis cursus in hac habitasse platea. Donec pretium vulputate sapien nec. Mi bibendum neque egestas congue quisque egestas diam in.

Tellus in metus vulputate eu. Egestas egestas fringilla phasellus faucibus scelerisque eleifend donec pretium. Tristique risus nec feugiat in fermentum. Volutpat blandit aliquam etiam erat. Ac ut consequat semper viverra nam libero. Volutpat sed cras ornare arcu dui vivamus. Mus mauris vitae ultricies leo integer malesuada nunc vel. Enim nulla aliquet porttitor lacus luctus accumsan tortor. Turpis tincidunt id aliquet risus feugiat. Lacus sed viverra tellus in hac. Dui id ornare arcu odio ut sem. A condimentum vitae sapien pellentesque habitant morbi tristique senectus. Leo urna molestie at elementum eu facilisis.

Rutrum tellus pellentesque eu tincidunt. Proin fermentum leo vel orci porta non. Pretium nibh ipsum consequat nisl vel pretium lectus quam. Eget dolor morbi non arcu risus quis varius quam quisque. Aliquam nulla facilisi cras fermentum odio eu feugiat pretium nibh. Quis viverra nibh cras pulvinar mattis. Elit duis tristique sollicitudin nibh sit amet commodo nulla. Ac auctor augue mauris augue neque gravida. Vestibulum morbi blandit cursus risus at ultrices mi tempus imperdiet. Porttitor eget dolor morbi non arcu risus quis varius quam.

Viverra justo nec ultrices dui sapien eget. Facilisis gravida neque convallis a. Consequat interdum varius sit amet mattis vulputate enim. Rhoncus est pellentesque elit ullamcorper dignissim cras tincidunt. At risus viverra adipiscing at in tellus integer feugiat scelerisque. Tellus molestie nunc non blandit massa. Tincidunt nunc pulvinar sapien et ligula ullamcorper. Tincidunt arcu non sodales neque sodales ut. Est lorem ipsum dolor sit amet consectetur adipiscing. Ipsum a arcu cursus vitae congue. Tincidunt dui ut ornare lectus sit. Diam maecenas sed enim ut sem viverra aliquet eget sit. Ut eu sem integer vitae justo eget magna fermentum iaculis. In iaculis nunc sed augue. Aliquet enim tortor at auctor urna nunc. Dui vivamus arcu felis bibendum ut tristique.

Integer enim neque volutpat ac tincidunt. Egestas purus viverra accumsan in nisl nisi scelerisque. At quis risus sed vulputate odio. Suspendisse sed nisi lacus sed viverra tellus. Ipsum dolor sit amet consectetur adipiscing elit duis tristique sollicitudin. Enim facilisis gravida neque convallis a cras semper. Eu facilisis sed odio morbi quis. Egestas sed tempus urna et pharetra pharetra massa massa ultricies. Fusce id velit ut tortor pretium viverra suspendisse potenti nullam. Nisl condimentum id venenatis a condimentum. Viverra aliquet eget sit amet tellus. Neque egestas congue quisque egestas diam in arcu cursus euismod. Integer vitae justo eget magna. Duis convallis convallis tellus id interdum velit laoreet id. Faucibus a pellentesque sit amet porttitor eget. Tristique senectus et netus et malesuada fames ac. Pellentesque elit ullamcorper dignissim cras. Magnis dis parturient montes nascetur ridiculus mus mauris vitae ultricies. Commodo odio aenean sed adipiscing.

Fringilla ut morbi tincidunt augue interdum velit. Suspendisse interdum consectetur libero id faucibus nisl. Ut consequat semper viverra nam libero justo. Placerat orci nulla pellentesque dignissim enim sit amet venenatis urna. Vitae auctor eu augue ut lectus arcu bibendum at varius. Quam lacus suspendisse faucibus interdum posuere lorem ipsum dolor sit. Dignissim diam quis enim lobortis scelerisque fermentum dui faucibus. Ultricies mi quis hendrerit dolor magna eget. Volutpat sed cras ornare arcu dui vivamus. Lorem ipsum dolor sit amet consectetur adipiscing elit. Massa tincidunt dui ut ornare lectus sit amet. Libero justo laoreet sit amet cursus. Turpis in eu mi bibendum neque egestas congue. Quis vel eros donec ac odio tempor orci. Donec pretium vulputate sapien nec sagittis aliquam malesuada bibendum arcu. Scelerisque eu ultrices vitae auctor eu augue ut lectus arcu. Tellus rutrum tellus pellentesque eu. Id aliquet risus feugiat in. Aliquet bibendum enim facilisis gravida neque convallis a.

Vel orci porta non pulvinar neque laoreet suspendisse interdum consectetur. Congue quisque egestas diam in. Quisque egestas diam in arcu cursus euismod quis viverra nibh. Vel pharetra vel turpis nunc eget lorem dolor sed viverra. Enim nec dui nunc mattis. Vitae purus faucibus ornare suspendisse. Sed augue lacus viverra vitae. Arcu cursus euismod quis viverra nibh cras. Pulvinar elementum integer enim neque volutpat. Nunc pulvinar sapien et ligula ullamcorper. In nisl nisi scelerisque eu ultrices. Mauris nunc congue nisi vitae. Nisl nunc mi ipsum faucibus vitae aliquet nec ullamcorper sit.

Quis eleifend quam adipiscing vitae proin sagittis nisl. Suscipit adipiscing bibendum est ultricies integer quis auctor elit. Sed adipiscing diam donec adipiscing. Aliquam vestibulum morbi blandit cursus. Tellus mauris a diam maecenas sed enim ut sem viverra. Leo urna molestie at elementum eu facilisis sed odio morbi. Nunc scelerisque viverra mauris in aliquam sem fringilla ut. Id velit ut tortor pretium viverra suspendisse. Velit aliquet sagittis id consectetur purus ut. Cursus sit amet dictum sit amet justo donec enim diam. Pretium aenean pharetra magna ac placerat. Tempus iaculis urna id volutpat lacus. Tristique senectus et netus et. Tempus urna et pharetra pharetra massa massa ultricies mi. Imperdiet nulla malesuada pellentesque elit. Magna fringilla urna porttitor rhoncus. Vestibulum rhoncus est pellentesque elit ullamcorper dignissim. Faucibus et molestie ac feugiat sed lectus vestibulum. Enim ut tellus elementum sagittis vitae et leo.

Ligula ullamcorper malesuada proin libero. Elementum nibh tellus molestie nunc non blandit massa enim nec. Mauris a diam maecenas sed. Pharetra convallis posuere morbi leo urna. Eget felis eget nunc lobortis mattis aliquam faucibus purus. Id diam maecenas ultricies mi eget mauris pharetra et ultrices. Enim ut sem viverra aliquet eget. Vitae semper quis lectus nulla. Ultrices mi tempus imperdiet nulla malesuada pellentesque. Maecenas sed enim ut sem. Libero enim sed faucibus turpis in eu mi. Mattis rhoncus urna neque viverra justo nec ultrices. Sollicitudin ac orci phasellus egestas tellus.

Nibh cras pulvinar mattis nunc. Aliquet enim tortor at auctor. Varius vel pharetra vel turpis nunc eget lorem dolor sed. Ut venenatis tellus in metus vulputate eu scelerisque felis imperdiet. Turpis egestas sed tempus urna. Massa enim nec dui nunc. Nullam ac tortor vitae purus faucibus. Sed elementum tempus egestas sed sed. Felis donec et odio pellentesque diam volutpat commodo sed egestas. Non consectetur a erat nam at lectus urna.

Lorem ipsum dolor sit amet consectetur adipiscing elit. Turpis egestas maecenas pharetra convallis posuere morbi leo urna. Duis ut diam quam nulla. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae auctor. Pellentesque adipiscing commodo elit at imperdiet dui accumsan sit amet. Enim ut tellus elementum sagittis vitae. Ac felis donec et odio pellentesque diam volutpat. Mus mauris vitae ultricies leo. Sodales ut etiam sit amet nisl purus in. Bibendum est ultricies integer quis. Fringilla urna porttitor rhoncus dolor purus non enim. Lacus sed turpis tincidunt id aliquet risus.

Dictum at tempor commodo ullamcorper a lacus vestibulum sed. Convallis tellus id interdum velit laoreet id donec. Faucibus purus in massa tempor nec feugiat nisl pretium fusce. Et ultrices neque ornare aenean euismod. Pretium quam vulputate dignissim suspendisse in est ante. Lorem dolor sed viverra ipsum nunc aliquet bibendum. Ut tellus elementum sagittis vitae et leo duis ut. Fringilla urna porttitor rhoncus dolor. Urna id volutpat lacus laoreet non curabitur gravida arcu ac. Volutpat sed cras ornare arcu dui. Netus et malesuada fames ac turpis egestas sed tempus urna. Nam at lectus urna duis. Rutrum quisque non tellus orci. Ultricies leo integer malesuada nunc vel. Ut ornare lectus sit amet. Pellentesque adipiscing commodo elit at imperdiet dui. Et malesuada fames ac turpis. Eu mi bibendum neque egestas congue quisque. Viverra orci sagittis eu volutpat.

Ornare lectus sit amet est placerat in egestas erat. Elit sed vulputate mi sit amet mauris. Ultricies tristique nulla aliquet enim tortor at auctor. Hac habitasse platea dictumst quisque sagittis. Id faucibus nisl tincidunt eget. Nec ultrices dui sapien eget mi proin sed libero. Nisl rhoncus mattis rhoncus urna neque viverra justo. Faucibus in ornare quam viverra orci sagittis eu volutpat. Duis ut diam quam nulla porttitor. Odio euismod lacinia at quis risus sed vulputate odio. Metus vulputate eu scelerisque felis imperdiet proin fermentum leo. Vivamus arcu felis bibendum ut tristique et egestas quis ipsum. Egestas pretium aenean pharetra magna. Tortor id aliquet lectus proin. Egestas pretium aenean pharetra magna ac. Consequat id porta nibh venenatis cras sed felis. Sem viverra aliquet eget sit amet tellus.

Odio pellentesque diam volutpat commodo sed egestas egestas fringilla phasellus. Vitae congue mauris rhoncus aenean. Nam at lectus urna duis convallis. Iaculis at erat pellentesque adipiscing commodo elit at imperdiet dui. Eu facilisis sed odio morbi quis commodo odio. Viverra orci sagittis eu volutpat odio facilisis mauris sit amet. Sit amet risus nullam eget. Laoreet non curabitur gravida arcu ac tortor dignissim. Faucibus pulvinar elementum integer enim. Eu non diam phasellus vestibulum lorem sed. Vulputate sapien nec sagittis aliquam malesuada. Pharetra magna ac placerat vestibulum lectus. Diam quam nulla porttitor massa id neque aliquam. Lobortis scelerisque fermentum dui faucibus in ornare. Ultricies mi eget mauris pharetra et ultrices neque ornare. Euismod nisi porta lorem mollis aliquam ut. Iaculis urna id volutpat lacus laoreet non curabitur.

Laoreet suspendisse interdum consectetur libero id faucibus nisl tincidunt eget. Neque viverra justo nec ultrices. Elementum curabitur vitae nunc sed velit dignissim. Tempus quam pellentesque nec nam aliquam sem et. Sit amet mauris commodo quis imperdiet massa. Faucibus turpis in eu mi bibendum neque egestas. Nunc sed augue lacus viverra vitae congue eu consequat. Habitant morbi tristique senectus et netus. Lectus quam id leo in vitae. Lobortis mattis aliquam faucibus purus in. Dis parturient montes nascetur ridiculus.

Faucibus et molestie ac feugiat sed. Tellus molestie nunc non blandit massa enim nec. Arcu cursus vitae congue mauris rhoncus aenean. Natoque penatibus et magnis dis parturient montes nascetur. Orci sagittis eu volutpat odio facilisis mauris sit amet massa. Sed egestas egestas fringilla phasellus faucibus scelerisque eleifend. Facilisis volutpat est velit egestas dui id ornare arcu odio. Eu augue ut lectus arcu bibendum at varius vel. Tincidunt id aliquet risus feugiat. Mi tempus imperdiet nulla malesuada pellentesque elit. Vitae nunc sed velit dignissim sodales ut. Neque vitae tempus quam pellentesque nec nam aliquam sem. Odio pellentesque diam volutpat commodo sed egestas. Adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus urna. Eget nunc lobortis mattis aliquam faucibus purus in massa. Scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt. Enim eu turpis egestas pretium aenean pharetra magna. Mattis enim ut tellus elementum sagittis vitae et leo duis.

Nunc faucibus a pellentesque sit amet porttitor eget. In dictum non consectetur a erat nam at. Sem et tortor consequat id porta nibh venenatis cras sed. Scelerisque in dictum non consectetur a erat. Ipsum dolor sit amet consectetur. Turpis in eu mi bibendum neque egestas. Arcu dui vivamus arcu felis bibendum. Ultrices sagittis orci a scelerisque purus semper eget. Erat pellentesque adipiscing commodo elit. Blandit volutpat maecenas volutpat blandit aliquam etiam erat velit scelerisque. Nisi est sit amet facilisis magna etiam tempor orci. Sagittis purus sit amet volutpat consequat mauris nunc. Facilisis volutpat est velit egestas dui id ornare arcu. Dolor sit amet consectetur adipiscing elit ut aliquam purus. In nisl nisi scelerisque eu.

Blandit turpis cursus in hac habitasse platea. Facilisis leo vel fringilla est. Nisl nisi scelerisque eu ultrices vitae auctor eu. Id nibh tortor id aliquet. Eget nullam non nisi est sit. Ac placerat vestibulum lectus mauris ultrices eros in cursus turpis. Non curabitur gravida arcu ac tortor dignissim. Non quam lacus suspendisse faucibus interdum posuere lorem ipsum. Eu facilisis sed odio morbi quis commodo odio aenean. Aliquam vestibulum morbi blandit cursus. Lorem ipsum dolor sit amet consectetur adipiscing elit pellentesque. Id interdum velit laoreet id donec ultrices. Justo eget magna fermentum iaculis eu. Viverra nibh cras pulvinar mattis nunc sed. Nibh tortor id aliquet lectus proin. Egestas pretium aenean pharetra magna.

Dolor morbi non arcu risus quis varius quam. Dignissim diam quis enim lobortis. Egestas integer eget aliquet nibh praesent tristique magna sit amet. Amet commodo nulla facilisi nullam vehicula ipsum a. Nulla malesuada pellentesque elit eget gravida cum. Id interdum velit laoreet id donec ultrices. Amet luctus venenatis lectus magna. Pellentesque sit amet porttitor eget dolor morbi. Parturient montes nascetur ridiculus mus mauris vitae ultricies leo. Sagittis orci a scelerisque purus semper eget duis at tellus. Etiam dignissim diam quis enim lobortis scelerisque fermentum dui.

Nisi porta lorem mollis aliquam. Viverra tellus in hac habitasse platea dictumst vestibulum rhoncus. Quis eleifend quam adipiscing vitae proin sagittis nisl rhoncus mattis. Varius morbi enim nunc faucibus a pellentesque. Volutpat ac tincidunt vitae semper quis lectus nulla at volutpat. Urna duis convallis convallis tellus id interdum velit laoreet id. Ut morbi tincidunt augue interdum velit. Feugiat in fermentum posuere urna nec tincidunt. Sit amet mauris commodo quis imperdiet. Amet nisl suscipit adipiscing bibendum. Cursus metus aliquam eleifend mi. Consectetur adipiscing elit pellentesque habitant. Ac turpis egestas maecenas pharetra convallis posuere. Ornare suspendisse sed nisi lacus sed viverra. In ante metus dictum at tempor. Commodo ullamcorper a lacus vestibulum sed arcu non odio. Condimentum id venenatis a condimentum vitae sapien pellentesque habitant. Molestie at elementum eu facilisis sed odio. Justo donec enim diam vulputate ut pharetra sit amet.

Nisl suscipit adipiscing bibendum est ultricies integer quis auctor. Aliquet nibh praesent tristique magna. Et odio pellentesque diam volutpat commodo sed. Vitae sapien pellentesque habitant morbi. Sit amet dictum sit amet justo donec enim diam. Tellus elementum sagittis vitae et. Feugiat in ante metus dictum at tempor commodo ullamcorper. Malesuada nunc vel risus commodo viverra maecenas accumsan lacus. Viverra adipiscing at in tellus integer feugiat scelerisque varius morbi. Dis parturient montes nascetur ridiculus mus mauris vitae ultricies leo. Sed nisi lacus sed viverra tellus in. Velit dignissim sodales ut eu sem integer vitae justo. Eleifend mi in nulla posuere sollicitudin aliquam. Lacus vel facilisis volutpat est velit egestas dui. Cras fermentum odio eu feugiat pretium nibh ipsum. At tempor commodo ullamcorper a lacus vestibulum sed arcu. Tristique sollicitudin nibh sit amet commodo nulla facilisi nullam vehicula. Aliquam faucibus purus in massa tempor nec feugiat nisl pretium. Enim sit amet venenatis urna cursus eget. Eget nunc lobortis mattis aliquam faucibus purus in.

Sed euismod nisi porta lorem mollis aliquam. Varius duis at consectetur lorem donec massa sapien. Lacus suspendisse faucibus interdum posuere. Viverra suspendisse potenti nullam ac tortor vitae. Eu consequat ac felis donec et odio. Purus faucibus ornare suspendisse sed nisi lacus sed viverra tellus. Aliquam sem et tortor consequat id. Ac turpis egestas integer eget. Luctus venenatis lectus magna fringilla urna porttitor. Justo donec enim diam vulputate ut pharetra sit amet. Mattis rhoncus urna neque viverra justo nec ultrices dui.

Etiam erat velit scelerisque in. Mattis pellentesque id nibh tortor id aliquet lectus proin nibh. Sed sed risus pretium quam vulputate dignissim. Ornare arcu dui vivamus arcu. Ut porttitor leo a diam sollicitudin tempor id eu nisl. Commodo odio aenean sed adipiscing. Enim facilisis gravida neque convallis a. A cras semper auctor neque. Volutpat lacus laoreet non curabitur gravida arcu ac tortor. Tortor condimentum lacinia quis vel. Laoreet suspendisse interdum consectetur libero id faucibus. Aliquam faucibus purus in massa tempor nec. Scelerisque in dictum non consectetur a erat nam at. Ut pharetra sit amet aliquam id diam. Id consectetur purus ut faucibus pulvinar. Varius duis at consectetur lorem. Cursus in hac habitasse platea dictumst quisque sagittis purus. Imperdiet dui accumsan sit amet. Natoque penatibus et magnis dis parturient montes nascetur.

Id nibh tortor id aliquet lectus proin nibh nisl condimentum. Nisi quis eleifend quam adipiscing vitae proin sagittis. Euismod quis viverra nibh cras pulvinar mattis nunc. Quam vulputate dignissim suspendisse in est ante in. Tortor consequat id porta nibh venenatis cras sed. Tortor at risus viverra adipiscing at in. Arcu cursus euismod quis viverra nibh cras pulvinar. Eget sit amet tellus cras adipiscing enim eu turpis. Et ultrices neque ornare aenean euismod. Iaculis eu non diam phasellus vestibulum lorem sed risus. Laoreet non curabitur gravida arcu ac tortor dignissim convallis.

Turpis egestas maecenas pharetra convallis posuere morbi leo. Parturient montes nascetur ridiculus mus mauris vitae ultricies leo integer. Odio facilisis mauris sit amet massa vitae. Praesent tristique magna sit amet purus gravida quis blandit turpis. Vel pharetra vel turpis nunc eget lorem dolor sed. Id diam vel quam elementum pulvinar etiam non quam lacus. Odio facilisis mauris sit amet. Pharetra et ultrices neque ornare aenean. Nibh nisl condimentum id venenatis a condimentum vitae sapien pellentesque. Varius duis at consectetur lorem donec massa sapien faucibus et. Pretium vulputate sapien nec sagittis. Vitae semper quis lectus nulla at volutpat diam ut. Nisl vel pretium lectus quam. Vitae suscipit tellus mauris a diam maecenas sed. Velit aliquet sagittis id consectetur purus ut faucibus pulvinar. Nisl condimentum id venenatis a condimentum.

Donec pretium vulputate sapien nec. Diam quis enim lobortis scelerisque fermentum. Commodo ullamcorper a lacus vestibulum sed. Dignissim cras tincidunt lobortis feugiat vivamus at augue eget arcu. Cras fermentum odio eu feugiat. Tellus orci ac auctor augue mauris augue neque. Et netus et malesuada fames ac turpis egestas sed tempus. Nisl tincidunt eget nullam non nisi est sit amet facilisis. Condimentum vitae sapien pellentesque habitant morbi tristique senectus. Porttitor massa id neque aliquam. Velit euismod in pellentesque massa. Pharetra magna ac placerat vestibulum lectus. Semper eget duis at tellus at urna condimentum mattis. Sed tempus urna et pharetra pharetra. Pellentesque id nibh tortor id aliquet. Enim sed faucibus turpis in eu mi bibendum. Nullam non nisi est sit. Neque viverra justo nec ultrices dui sapien eget.

Faucibus turpis in eu mi bibendum. Ultricies integer quis auctor elit sed vulputate mi sit. Sit amet dictum sit amet justo. Tortor at auctor urna nunc. Vel pharetra vel turpis nunc eget lorem. Eu consequat ac felis donec et odio pellentesque diam. Lectus sit amet est placerat. Eros in cursus turpis massa tincidunt. At elementum eu facilisis sed. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Auctor augue mauris augue neque gravida in fermentum et sollicitudin. Placerat duis ultricies lacus sed turpis tincidunt id aliquet. Lacinia quis vel eros donec. Dictum varius duis at consectetur lorem donec massa. Et netus et malesuada fames ac turpis egestas sed. Cras sed felis eget velit aliquet.

Molestie ac feugiat sed lectus vestibulum mattis. Sed velit dignissim sodales ut eu sem integer vitae justo. Imperdiet massa tincidunt nunc pulvinar sapien et ligula. Mauris a diam maecenas sed enim ut sem viverra aliquet. Egestas quis ipsum suspendisse ultrices. Aenean vel elit scelerisque mauris. At ultrices mi tempus imperdiet nulla. Scelerisque eleifend donec pretium vulputate sapien nec sagittis aliquam. Ornare lectus sit amet est placerat in egestas erat. Quisque sagittis purus sit amet volutpat. Quam nulla porttitor massa id neque aliquam vestibulum. Curabitur gravida arcu ac tortor dignissim. Fermentum odio eu feugiat pretium nibh ipsum consequat nisl vel. Nec feugiat in fermentum posuere urna nec tincidunt praesent semper. Pharetra convallis posuere morbi leo urna molestie. Egestas diam in arcu cursus euismod quis viverra nibh cras. Erat nam at lectus urna duis convallis convallis tellus. Diam in arcu cursus euismod quis viverra. Purus faucibus ornare suspendisse sed nisi.

Iaculis at erat pellentesque adipiscing commodo elit at. Amet cursus sit amet dictum sit amet. Nec feugiat in fermentum posuere urna nec tincidunt. Habitant morbi tristique senectus et netus et. Gravida rutrum quisque non tellus orci ac auctor augue mauris. Augue ut lectus arcu bibendum. Tempus imperdiet nulla malesuada pellentesque elit eget. Id eu nisl nunc mi. Hendrerit gravida rutrum quisque non. Nunc sed id semper risus. Pharetra sit amet aliquam id diam maecenas ultricies mi.

Neque gravida in fermentum et sollicitudin ac. Non diam phasellus vestibulum lorem sed risus ultricies tristique. Etiam erat velit scelerisque in. Aliquam id diam maecenas ultricies. Vel pharetra vel turpis nunc eget lorem. Quis commodo odio aenean sed adipiscing diam. Tincidunt vitae semper quis lectus. Massa sed elementum tempus egestas sed. Rhoncus urna neque viverra justo nec ultrices dui sapien eget. Nisi vitae suscipit tellus mauris a diam.

Placerat vestibulum lectus mauris ultrices eros in. Nec sagittis aliquam malesuada bibendum arcu vitae elementum curabitur vitae. Rutrum tellus pellentesque eu tincidunt tortor aliquam nulla facilisi. Nunc non blandit massa enim nec. Ac tortor vitae purus faucibus ornare suspendisse sed nisi lacus. Elementum nisi quis eleifend quam adipiscing vitae proin sagittis. Egestas maecenas pharetra convallis posuere morbi leo urna molestie. Adipiscing vitae proin sagittis nisl rhoncus. At volutpat diam ut venenatis tellus. Nisi est sit amet facilisis magna etiam tempor orci eu. Amet nisl suscipit adipiscing bibendum. Et tortor at risus viverra. Vitae congue mauris rhoncus aenean vel elit scelerisque.

Tincidunt dui ut ornare lectus sit amet est placerat. Sapien faucibus et molestie ac feugiat. Sit amet facilisis magna etiam. Elementum nibh tellus molestie nunc non. Purus semper eget duis at tellus. Non odio euismod lacinia at quis risus sed. Odio tempor orci dapibus ultrices in. Sit amet nulla facilisi morbi tempus iaculis urna id volutpat. Facilisis leo vel fringilla est ullamcorper eget nulla. Consectetur libero id faucibus nisl tincidunt eget nullam. Penatibus et magnis dis parturient montes nascetur ridiculus. Pellentesque sit amet porttitor eget dolor morbi non arcu risus. Porttitor eget dolor morbi non. Nunc scelerisque viverra mauris in. Pellentesque sit amet porttitor eget dolor morbi. Arcu risus quis varius quam quisque id diam vel quam.

Turpis massa tincidunt dui ut ornare lectus sit amet. Egestas erat imperdiet sed euismod nisi porta lorem mollis. Tortor aliquam nulla facilisi cras fermentum odio. Mauris pellentesque pulvinar pellentesque habitant morbi tristique senectus et. Eget felis eget nunc lobortis mattis aliquam faucibus purus in. Dignissim sodales ut eu sem integer vitae. Gravida neque convallis a cras semper auctor neque. Amet dictum sit amet justo donec enim. Tellus orci ac auctor augue mauris. Amet porttitor eget dolor morbi non arcu risus quis. Enim sed faucibus turpis in. Suspendisse potenti nullam ac tortor. Ut diam quam nulla porttitor massa id. Sapien nec sagittis aliquam malesuada bibendum. Arcu risus quis varius quam quisque id diam vel quam. Sed velit dignissim sodales ut eu sem integer. Id volutpat lacus laoreet non curabitur gravida. Maecenas volutpat blandit aliquam etiam erat velit. A cras semper auctor neque vitae.

Semper quis lectus nulla at volutpat diam ut venenatis tellus. Tortor at auctor urna nunc id cursus metus aliquam eleifend. Est lorem ipsum dolor sit amet consectetur adipiscing. Convallis tellus id interdum velit laoreet id donec ultrices. Dolor sit amet consectetur adipiscing elit duis. Imperdiet nulla malesuada pellentesque elit eget gravida cum sociis natoque. Sit amet purus gravida quis. Aliquet lectus proin nibh nisl condimentum id. Commodo elit at imperdiet dui accumsan sit amet nulla. Quis blandit turpis cursus in.

Pharetra vel turpis nunc eget lorem. Eget duis at tellus at urna condimentum mattis pellentesque id. Aliquet sagittis id consectetur purus ut faucibus. Tincidunt lobortis feugiat vivamus at augue eget arcu. Tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada proin. Dictum varius duis at consectetur lorem donec. Pretium aenean pharetra magna ac. Congue nisi vitae suscipit tellus mauris a diam maecenas. Blandit aliquam etiam erat velit scelerisque. Interdum consectetur libero id faucibus nisl tincidunt eget nullam. Consectetur adipiscing elit pellentesque habitant morbi tristique senectus et.

Eget est lorem ipsum dolor. Sagittis aliquam malesuada bibendum arcu vitae elementum. Mattis aliquam faucibus purus in massa tempor nec feugiat. Dolor magna eget est lorem ipsum dolor sit. Sed cras ornare arcu dui vivamus arcu felis. Elit ullamcorper dignissim cras tincidunt. Et malesuada fames ac turpis. Faucibus a pellentesque sit amet porttitor eget. Integer feugiat scelerisque varius morbi. Et tortor consequat id porta nibh venenatis. Pulvinar sapien et ligula ullamcorper malesuada proin libero. Aliquam sem fringilla ut morbi tincidunt augue interdum. Nulla pellentesque dignissim enim sit amet venenatis urna cursus. Vitae ultricies leo integer malesuada nunc vel risus commodo viverra. Egestas diam in arcu cursus. Etiam erat velit scelerisque in dictum non consectetur. Id consectetur purus ut faucibus pulvinar elementum integer enim. Purus non enim praesent elementum.

Pellentesque nec nam aliquam sem et tortor consequat id. Non quam lacus suspendisse faucibus interdum posuere lorem ipsum dolor. Ut enim blandit volutpat maecenas volutpat. Ut eu sem integer vitae justo eget magna fermentum. Morbi tempus iaculis urna id. Viverra accumsan in nisl nisi scelerisque eu. Egestas purus viverra accumsan in nisl nisi scelerisque eu ultrices. Laoreet non curabitur gravida arcu ac tortor dignissim convallis aenean. In fermentum posuere urna nec tincidunt praesent. Purus viverra accumsan in nisl nisi scelerisque eu. Mi quis hendrerit dolor magna eget est.

Ornare aenean euismod elementum nisi quis eleifend. Nunc scelerisque viverra mauris in aliquam. Tortor at risus viverra adipiscing at in. Aenean pharetra magna ac placerat vestibulum lectus. Eu volutpat odio facilisis mauris sit amet massa vitae. Nunc consequat interdum varius sit amet mattis. Neque laoreet suspendisse interdum consectetur libero id faucibus. In iaculis nunc sed augue lacus viverra vitae congue eu. Scelerisque viverra mauris in aliquam sem fringilla. Sit amet nisl purus in mollis. Orci sagittis eu volutpat odio facilisis. Hac habitasse platea dictumst vestibulum rhoncus est. Non arcu risus quis varius quam quisque id diam vel. Arcu felis bibendum ut tristique et. Risus commodo viverra maecenas accumsan lacus. Augue neque gravida in fermentum et. Vel orci porta non pulvinar neque laoreet.

Vitae et leo duis ut diam quam nulla. Non pulvinar neque laoreet suspendisse interdum. Adipiscing elit duis tristique sollicitudin. Diam maecenas sed enim ut. Nullam ac tortor vitae purus faucibus ornare suspendisse sed. Habitant morbi tristique senectus et netus et malesuada fames ac. Sit amet facilisis magna etiam tempor. Sit amet est placerat in egestas. Amet dictum sit amet justo donec enim diam. Mauris a diam maecenas sed enim ut. Mollis aliquam ut porttitor leo a diam. Egestas diam in arcu cursus.

Adipiscing bibendum est ultricies integer quis. Mauris cursus mattis molestie a iaculis. Ornare arcu dui vivamus arcu felis bibendum. Suscipit adipiscing bibendum est ultricies integer. Sagittis vitae et leo duis ut diam quam. At volutpat diam ut venenatis tellus. Diam donec adipiscing tristique risus nec feugiat in fermentum posuere. Lorem ipsum dolor sit amet. Turpis in eu mi bibendum neque. Bibendum enim facilisis gravida neque convallis a cras semper. Sed odio morbi quis commodo. Tincidunt arcu non sodales neque sodales ut etiam sit amet. Risus viverra adipiscing at in. Aliquam ut porttitor leo a diam sollicitudin tempor. Porttitor lacus luctus accumsan tortor posuere ac ut consequat semper. Consectetur a erat nam at lectus urna duis convallis convallis. Sem viverra aliquet eget sit. Diam quis enim lobortis scelerisque fermentum dui. Tincidunt augue interdum velit euismod in pellentesque.

Vitae semper quis lectus nulla at volutpat. Tortor at auctor urna nunc id cursus metus aliquam eleifend. Vulputate mi sit amet mauris commodo quis imperdiet. Amet cursus sit amet dictum sit amet justo donec enim. Amet porttitor eget dolor morbi. Tincidunt id aliquet risus feugiat in ante metus dictum at. Dictum sit amet justo donec enim diam vulputate. Nulla aliquet porttitor lacus luctus accumsan tortor posuere. Elementum facilisis leo vel fringilla est ullamcorper eget nulla facilisi. Dis parturient montes nascetur ridiculus mus mauris vitae ultricies leo. Turpis egestas maecenas pharetra convallis posuere. Nisi scelerisque eu ultrices vitae auctor eu augue ut. Vulputate odio ut enim blandit volutpat maecenas. Donec ac odio tempor orci dapibus ultrices in iaculis nunc. Integer vitae justo eget magna fermentum iaculis.

Fermentum dui faucibus in ornare quam viverra orci sagittis. Id faucibus nisl tincidunt eget. Egestas dui id ornare arcu odio ut sem nulla pharetra. Diam volutpat commodo sed egestas egestas. Non blandit massa enim nec dui nunc. Scelerisque eu ultrices vitae auctor eu augue ut. Ipsum faucibus vitae aliquet nec. Odio ut enim blandit volutpat maecenas volutpat. In fermentum et sollicitudin ac. Dui sapien eget mi proin sed libero enim. Id venenatis a condimentum vitae sapien pellentesque. Vel fringilla est ullamcorper eget nulla facilisi etiam dignissim diam. Pretium quam vulputate dignissim suspendisse in est.

Platea dictumst vestibulum rhoncus est pellentesque elit. Purus in mollis nunc sed. Pharetra sit amet aliquam id. Id porta nibh venenatis cras sed felis. Id neque aliquam vestibulum morbi blandit cursus risus. Lacus vestibulum sed arcu non odio euismod. Quisque id diam vel quam elementum. Tellus elementum sagittis vitae et leo duis ut diam quam. Amet commodo nulla facilisi nullam vehicula ipsum a arcu cursus. Felis eget nunc lobortis mattis. Lectus mauris ultrices eros in cursus turpis massa tincidunt. Commodo nulla facilisi nullam vehicula ipsum. Platea dictumst vestibulum rhoncus est. Montes nascetur ridiculus mus mauris.

Dis parturient montes nascetur ridiculus mus mauris vitae. Dolor sit amet consectetur adipiscing elit duis. Phasellus egestas tellus rutrum tellus pellentesque eu tincidunt tortor aliquam. Sem viverra aliquet eget sit amet tellus. Lorem sed risus ultricies tristique nulla aliquet enim tortor. Vulputate mi sit amet mauris commodo quis imperdiet. Metus dictum at tempor commodo ullamcorper a. Sit amet est placerat in egestas erat imperdiet. Suspendisse faucibus interdum posuere lorem ipsum dolor. Ut porttitor leo a diam sollicitudin tempor id eu. Ultricies mi eget mauris pharetra et ultrices neque. Lobortis mattis aliquam faucibus purus. Nibh venenatis cras sed felis eget velit aliquet sagittis id. Massa sapien faucibus et molestie ac feugiat sed lectus vestibulum. Ultrices eros in cursus turpis. Magna fermentum iaculis eu non. Phasellus vestibulum lorem sed risus ultricies tristique nulla aliquet enim. Aenean pharetra magna ac placerat vestibulum. Egestas erat imperdiet sed euismod.

Viverra maecenas accumsan lacus vel facilisis volutpat est velit. Ac felis donec et odio pellentesque diam. Scelerisque eu ultrices vitae auctor eu augue. Turpis egestas sed tempus urna et pharetra pharetra massa. Diam maecenas ultricies mi eget mauris. Lacinia at quis risus sed vulputate odio ut enim. Turpis tincidunt id aliquet risus feugiat in ante metus dictum. At tempor commodo ullamcorper a lacus vestibulum sed arcu. Arcu cursus vitae congue mauris rhoncus aenean vel. Sodales ut etiam sit amet nisl purus. Et malesuada fames ac turpis egestas sed tempus. Viverra suspendisse potenti nullam ac tortor vitae purus faucibus. Cursus euismod quis viverra nibh cras pulvinar mattis nunc. Eros donec ac odio tempor orci.

Ultricies lacus sed turpis tincidunt id aliquet risus. Tristique magna sit amet purus gravida. Faucibus et molestie ac feugiat sed. At quis risus sed vulputate odio ut enim. Sagittis purus sit amet volutpat consequat. Vitae proin sagittis nisl rhoncus mattis. Et leo duis ut diam quam nulla porttitor. Nec nam aliquam sem et tortor. Dignissim convallis aenean et tortor at risus. Justo laoreet sit amet cursus sit. Commodo quis imperdiet massa tincidunt. Massa tincidunt nunc pulvinar sapien et ligula ullamcorper. Nunc sed id semper risus in.

Proin sagittis nisl rhoncus mattis rhoncus urna neque viverra. Nisl suscipit adipiscing bibendum est ultricies integer quis auctor elit. Duis ut diam quam nulla. Maecenas volutpat blandit aliquam etiam erat velit scelerisque in dictum. Volutpat ac tincidunt vitae semper quis lectus. Eget sit amet tellus cras. Amet nisl suscipit adipiscing bibendum est ultricies integer quis auctor. Magna etiam tempor orci eu lobortis elementum. Amet nulla facilisi morbi tempus. Consequat id porta nibh venenatis. Massa sapien faucibus et molestie ac.

Ut faucibus pulvinar elementum integer enim neque volutpat ac. Ac turpis egestas sed tempus urna et pharetra. Enim ut tellus elementum sagittis vitae et leo duis. A pellentesque sit amet porttitor eget dolor. Phasellus egestas tellus rutrum tellus pellentesque eu tincidunt. Ut porttitor leo a diam sollicitudin tempor. Adipiscing elit duis tristique sollicitudin nibh sit amet commodo nulla. Ac tortor vitae purus faucibus ornare suspendisse sed nisi lacus. Erat nam at lectus urna duis convallis convallis tellus. Facilisi morbi tempus iaculis urna id. Egestas congue quisque egestas diam in. Orci sagittis eu volutpat odio facilisis. Volutpat sed cras ornare arcu. Elit ut aliquam purus sit. Tortor condimentum lacinia quis vel eros donec ac odio. Nunc lobortis mattis aliquam faucibus purus in massa tempor nec. Ac ut consequat semper viverra nam libero justo.

Nullam non nisi est sit amet facilisis magna etiam tempor. Mattis pellentesque id nibh tortor id. Fringilla phasellus faucibus scelerisque eleifend. Massa tincidunt nunc pulvinar sapien et ligula ullamcorper. Ut faucibus pulvinar elementum integer enim neque. Dignissim enim sit amet venenatis urna cursus eget nunc. Fermentum odio eu feugiat pretium nibh. Fermentum odio eu feugiat pretium nibh ipsum consequat nisl. Duis ut diam quam nulla porttitor massa id neque. Diam phasellus vestibulum lorem sed risus ultricies. Sem viverra aliquet eget sit. Enim tortor at auctor urna nunc id cursus metus aliquam. Diam phasellus vestibulum lorem sed risus ultricies tristique nulla aliquet. Mattis enim ut tellus elementum sagittis vitae et leo. Id nibh tortor id aliquet lectus proin nibh nisl. Justo laoreet sit amet cursus.

Amet luctus venenatis lectus magna. Nulla facilisi etiam dignissim diam quis enim lobortis. In ornare quam viverra orci sagittis eu volutpat odio. Egestas sed sed risus pretium quam. Ac tortor dignissim convallis aenean et tortor at risus. Neque gravida in fermentum et sollicitudin ac orci. Odio pellentesque diam volutpat commodo sed egestas. Nullam ac tortor vitae purus. Nibh ipsum consequat nisl vel pretium lectus quam id. Amet mauris commodo quis imperdiet. Auctor neque vitae tempus quam.

Arcu cursus euismod quis viverra nibh cras pulvinar mattis. Quis risus sed vulputate odio ut. Viverra mauris in aliquam sem fringilla ut morbi. Ut tellus elementum sagittis vitae et. Sed enim ut sem viverra aliquet eget sit. Volutpat odio facilisis mauris sit amet massa vitae tortor condimentum. Rhoncus dolor purus non enim praesent elementum facilisis leo. Pulvinar sapien et ligula ullamcorper malesuada. Cras pulvinar mattis nunc sed blandit libero volutpat sed cras. Tellus pellentesque eu tincidunt tortor aliquam.

Feugiat in fermentum posuere urna nec tincidunt praesent semper. Mauris commodo quis imperdiet massa tincidunt nunc. Pharetra sit amet aliquam id. Duis ultricies lacus sed turpis tincidunt id. Venenatis cras sed felis eget velit aliquet. Eu sem integer vitae justo eget magna fermentum iaculis eu. Neque ornare aenean euismod elementum nisi quis eleifend quam adipiscing. Ut venenatis tellus in metus vulputate. At risus viverra adipiscing at. Consectetur adipiscing elit ut aliquam purus sit amet. Ultrices sagittis orci a scelerisque purus semper. Ipsum nunc aliquet bibendum enim facilisis gravida.

Cursus vitae congue mauris rhoncus. Viverra accumsan in nisl nisi. Enim ut tellus elementum sagittis vitae. Nunc faucibus a pellentesque sit amet porttitor eget. Tincidunt lobortis feugiat vivamus at augue eget. Mattis enim ut tellus elementum sagittis. Amet justo donec enim diam vulputate ut pharetra sit amet. Nibh sit amet commodo nulla. Ut tristique et egestas quis ipsum suspendisse ultrices gravida. Nunc eget lorem dolor sed viverra ipsum. Purus semper eget duis at tellus at urna. Ullamcorper velit sed ullamcorper morbi tincidunt. Nulla malesuada pellentesque elit eget. Enim ut tellus elementum sagittis vitae et leo duis. Turpis egestas integer eget aliquet nibh.

Sed viverra tellus in hac habitasse platea. Sed blandit libero volutpat sed cras ornare. Risus at ultrices mi tempus imperdiet nulla. Blandit cursus risus at ultrices mi tempus. Vitae proin sagittis nisl rhoncus mattis rhoncus urna neque. Id semper risus in hendrerit gravida rutrum quisque non tellus. Senectus et netus et malesuada fames ac turpis egestas sed. Quisque non tellus orci ac auctor augue. Tincidunt dui ut ornare lectus sit amet est placerat. Ante in nibh mauris cursus mattis molestie a. Pellentesque sit amet porttitor eget. Porta lorem mollis aliquam ut porttitor leo a diam.

Dui sapien eget mi proin sed libero enim sed faucibus. Malesuada fames ac turpis egestas integer eget aliquet nibh praesent. Vitae congue mauris rhoncus aenean. Amet consectetur adipiscing elit duis tristique sollicitudin. Iaculis nunc sed augue lacus. Viverra vitae congue eu consequat ac felis donec. Sed cras ornare arcu dui vivamus arcu felis. Eu lobortis elementum nibh tellus molestie nunc. Ac ut consequat semper viverra nam libero justo. Dui ut ornare lectus sit amet est placerat in. Sit amet venenatis urna cursus eget nunc. Fringilla ut morbi tincidunt augue interdum. Metus aliquam eleifend mi in nulla. Id diam vel quam elementum pulvinar etiam non quam. Pharetra magna ac placerat vestibulum. Orci nulla pellentesque dignissim enim sit. A erat nam at lectus urna.''',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    letterSpacing: 1.0,
                                    height: 1.9,
                                    fontSize: 11,
                                    color: Colors.white,
                                    fontFamily: 'Playfair',
                                    fontWeight: FontWeight.w200),
                              ),
                            ]))
                      ])),
                      builder: (context, state) => Container(
                          height: 70.0,
                          color: Colors.black,
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 40,
                              ),
                              state.isPinned
                                  ? Center(
                                      child: Text(
                                        '03',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            letterSpacing: 0.2,
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w900),
                                      ),
                                    )
                                  : Container(),
                              state.isPinned
                                  ? SizedBox(
                                      height: 20,
                                    )
                                  : SizedBox(
                                      height: 100,
                                    ),
                            ],
                          )))
                ]))
          ]),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 90.0, right: 20),
            child: Container(
              width: 42.0,
              height: 140.0,
              child: Column(children: [new RawMaterialButton(
                shape: new BeveledRectangleBorder(),
                fillColor: Colors.black,
                elevation: 0.0,
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),new RawMaterialButton(
                shape: new BeveledRectangleBorder(),
                fillColor: Colors.black,
                elevation: 0.0,
                child: Icon(
                  Icons.bookmark_border,
                  color: Colors.white,
                ),
                onPressed: () {},
              )],) ,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniEndDocked,
        ));
  }
}

class CardFlipper extends StatefulWidget {
  CardFlipper({this.cards, this.onScroll, this.cardNum});

  final List<CardData> cards;
  final Function(double scrollPercent) onScroll;
  final int cardNum;

  @override
  State<StatefulWidget> createState() => _CardFlipper();
}

enum Direction { LEFT, RIGHT }

class _CardFlipper extends State<CardFlipper> with TickerProviderStateMixin {
  double scrollPercent = 0.0;
  Offset startDrag;
  double startDragPercentScroll;
  double finishScrollStart;
  double finishScrollEnd;
  AnimationController finishScrollController;
  Direction direction = Direction.LEFT;
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  @override
  void initState() {
    super.initState();
    finishScrollController =
        AnimationController(duration: Duration(milliseconds: 150), vsync: this)
          ..addListener(() {
            setState(() {
              scrollPercent = ui.lerpDouble(finishScrollStart, finishScrollEnd,
                  finishScrollController.value);
              widget.onScroll(scrollPercent);
            });
          });
  }

  @override
  void dispose() {
    finishScrollController.dispose();
    super.dispose();
  }

  void _onHorizontalDragStart(DragStartDetails details) {
    startDrag = details.globalPosition;
    startDragPercentScroll = scrollPercent;
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    final currDrag = details.globalPosition;
    final dragDistance = currDrag.dx - startDrag.dx;
    final allCardDragDistance = dragDistance / context.size.width;
    final numCards = widget.cards.length;
    if (allCardDragDistance > 0) {
      direction = Direction.LEFT;
    } else {
      direction = Direction.RIGHT;
    }
    setState(() {
      scrollPercent =
          (startDragPercentScroll + (-allCardDragDistance / numCards))
              .clamp(0.0, 1.0 - (1 / numCards));
      widget.onScroll(scrollPercent);
    });
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    final numCards = widget.cards.length;
    finishScrollStart = scrollPercent;

    if (direction == Direction.LEFT) {
      if (finishScrollEnd != 0) {
        cardKey.currentState.toggleCard();
      }
      finishScrollEnd = (scrollPercent * numCards).floor() / numCards;
    } else {
      if (finishScrollEnd == null || finishScrollEnd < 0.6666666666666666) {
        cardKey.currentState.toggleCard();
      }
      finishScrollEnd = (scrollPercent * numCards).ceil() / numCards;
    }
    print(scrollPercent);
    // print(int.parse(finishScrollEnd.toStringAsFixed(1)));
    print(direction);

    finishScrollController.forward(from: 0.0);
    setState(() {
      startDrag = null;
      startDragPercentScroll = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onHorizontalDragStart: _onHorizontalDragStart,
        onHorizontalDragUpdate: _onHorizontalDragUpdate,
        onHorizontalDragEnd: _onHorizontalDragEnd,
        behavior: HitTestBehavior.translucent,
        child: Hero(
          tag: "card${widget.cardNum}",
          child: FlipCard(
              key: cardKey,
              flipOnTouch: false,
              front: Container(
                height: 250,
                width: 220,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("res/dazed.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              back: Container(
                height: 250,
                width: 220,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("res/dazed.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              )),
        ));
  }
}

class BottomBar extends StatefulWidget {
  BottomBar({this.cardCount, this.scrollPercent});

  final int cardCount;
  final double scrollPercent;

  @override
  State<StatefulWidget> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35.0, bottom: 15.0, left: 70),
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${((widget.scrollPercent + 1) * 5).toInt()} JULY',
                textAlign: TextAlign.left,
                style: TextStyle(
                    letterSpacing: 0.6,
                    fontSize: 12.0,
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600),
              ),
              Container(
                width: 150,
                height: 2.0,
                child: ScrollIndicator(
                  cardCount: widget.cardCount,
                  scrollPercent: widget.scrollPercent,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ScrollIndicator extends StatelessWidget {
  ScrollIndicator({this.cardCount, this.scrollPercent});

  final int cardCount;
  final double scrollPercent;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ScrollIndicatorPainter(
          cardCount: cardCount, scrollPercent: scrollPercent),
      child: Container(),
    );
  }
}

class ScrollIndicatorPainter extends CustomPainter {
  ScrollIndicatorPainter({this.cardCount, this.scrollPercent})
      : trackPaint = Paint()
          ..color = Color(0xFF444444)
          ..style = PaintingStyle.fill,
        thumbPaint = Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill;

  final int cardCount;
  final double scrollPercent;
  final Paint trackPaint;
  final Paint thumbPaint;

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    canvas.drawRRect(
      RRect.fromRectAndCorners(
        Rect.fromLTWH(0.0, 0.0, size.width, size.height),
        topLeft: Radius.circular(3.0),
        topRight: Radius.circular(3.0),
        bottomLeft: Radius.circular(3.0),
        bottomRight: Radius.circular(3.0),
      ),
      trackPaint,
    );

    final thumbWidth = size.width / cardCount;
    final thumbLeft = scrollPercent * size.width;
    canvas.drawRRect(
      RRect.fromRectAndCorners(
        Rect.fromLTWH(thumbLeft, 0.0, thumbWidth, size.height),
        topLeft: Radius.circular(3.0),
        topRight: Radius.circular(3.0),
        bottomLeft: Radius.circular(3.0),
        bottomRight: Radius.circular(3.0),
      ),
      thumbPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
