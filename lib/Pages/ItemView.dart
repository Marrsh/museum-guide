import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:museum_guide/index.dart';
import 'package:museum_guide/museumModel.dart';

class ItemView extends StatelessWidget {
  const ItemView({required this.museumModel});
  final museumModel;

  @override
  Widget build(BuildContext context) {
    return (ListView(children: [
      Image(image: NetworkImage(museumModel.image)),
      Container(
          transform: Matrix4.translationValues(0.0, -10.0, 0.0),
          //   height: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                )
              ]),
          child: Column(children: [
            Padding(
              padding: EdgeInsets.all(3),
              child: Container(
                width: logicalScreenSize.width,
                decoration: BoxDecoration(
                    color: Colors.deepPurple[500],
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(1, 2), // changes position of shadow
                      )
                    ]),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    museumModel.title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: 'Roboto'),
                  ),
                ),
              ),
            ),
            // Text(
            //   "Blackboard covered with Graffiti (blackboard)",
            //   style: TextStyle(
            //       color: Colors.black, fontSize: 30, fontFamily: 'Roboto'),
            // ),
            // Divider(),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                museumModel.exhibit,
                style: TextStyle(
                    color: Colors.blue, fontSize: 20, fontFamily: 'Roboto'),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                '1980',
                style: TextStyle(
                    color: Colors.blue, fontSize: 20, fontFamily: 'Roboto'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Hawking kept this blackboard as a treasured souvenir of an international conference he organised in Cambridge. Guests at the event covered the blackboard in equations, cartoons and jokes about each other, and creatures named after mathematical tools. \n\nAt the conference, Hawking and his colleagues thought they were on the verge of a ‘theory of everything’ that would combine the two cornerstones of physics: general relativity, which describes the universe on its largest scales, and quantum theory, which explains the very small. The search goes on.\n\nMany of the jokes refer to the name and nationality of the co-organizer Martin Roček; a variety of creatures refer to the group of \"Vielbein' mathematical operators, which in German also means \"many-legs\". Hence for example an Einbein has one-leg, Vierbein has four, and Achtbein, the most promising for these theories, has eight and appears under different guises. \n\nThe list of conference participants reads like a Who's Who of the generation of physicists working on theories related to supersymmetry: Adams, J.F.; Avis, S.J.; Aragone, C.A.; Batchelor, M.; Baum, E.; Bedding, S; Brink, L.; Capper, D.M.; Castagnino, M.; Castelliani, L.; Cremmer, E.; de Wit, B.; DeWitt, B.S.; Doughty, N.; Duff, M.; Downes-Martin, S.; D'Adda, A.; Fawcett, M.; Freedman, D.Z.; Gates, S.J.; Gibbons, G.; Grisaru, M.; Hawking, S.J.; Hitchin, S.W.; Hull, C.; Howe, P.; Isham, C.J.; Jones, D.R.T.; Julia, B.; Kaku, M.; Karlhede, A.; Kostelecky, A.; Linstrom, U.; Lapedes, A.; MacDowell, S.W.; Moss, I.G.; Nielsen, N.K.; Page, D.N.; Payne, P.; Perry, M.J.; Pope, C.N.; Richer, J.; Rivelles, V.O.; Roček, M.; Rogers, A.; Ryan, P.; Siegel, W.; Slavnov, A.A.; Sokatchev, E.; Sornius, M.; Stelle, K.S.; Taylor, J.; Teitelboim, C.; Townsend, P.; Thierry-Mieg, J.; Van Holten, J.W.; Van Nieuwenhuizen, P.; Warner, N.; West, P.C.; Whiting, B.; Yuille, A.; Zumino, B.\n\nThe conference proceedings were published in a book that features this blackboard on the cover. \n\nWhat ever happened to this promising theory? \nOver the 1980s, the supergravity framework that was the centerpoint of this 1980 conference was considered a competitor to the other, more popular candidate: Superstrings. In the mid-1990s the two were shown to be compatible, but supergravity remained less popular. Still, in 2019 the initiators of Supergravity, Daniel Z. Freedman, Peter van Nieuwenhuizen and Sergio Ferrara won the highly esteemed Breakthrough Prize in Fundamental Physics. \nUntil the 2010s,  researchers working on theories based on supersymmetry, including superstrings and supergravity, were hopeful that a new generation of particle accelerators like the Large Hadron Collider (LHC) would bring data to confirm them. But after a decade of operation, the LHC has not found any evidence.\n\nAn ITV News clip featuring this blackboard, aired on February 11, 2022, can be seen via the link below:\nhttps://www.youtube.com/watch?v=L0KUX_EcFN8",
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
          ])),

      //   Text('Hello'),
    ]));
  }
}



    // Color.fromARGB(255, 88, 68, 68)t(
    //       'Category',
    //       style: TextStyle(color: Colors.black.withOpacity(0.6)),
    //     ),
    //     child: Text(
    //       'Description',
    //       style: TextStyle(color: Colors.black.withOpacity(0.6)),
    //     ),