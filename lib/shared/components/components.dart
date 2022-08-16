import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:magazine/modules/magazine_link_view/MagazineLinkView.dart';
import 'package:timeago/timeago.dart' as timeago;
class MagazineItem extends StatelessWidget {
  Map article;
  MagazineItem(this.article);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    DateTime time =DateTime.parse(article['publishedAt']);
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, MagazineLinkView.route , arguments: article['url']);
      },
      child: Container(
        padding: EdgeInsetsDirectional.all(16),
        height: height*0.25,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
                height: height*0.17,
                width: width*0.35,
                imageUrl: article['urlToImage']??'https://img.icons8.com/ios-glyphs/344/no-image.png',
                placeholder: (context , url)=>Center(child: CircularProgressIndicator(),),
                errorWidget: (context , url,error)=>Center(child: Icon(
                  Icons.broken_image,
                  size: 40,
                  color: Theme.of(context).primaryColor,
                ),),
                imageBuilder: (context , imageprovider){
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(image: imageprovider,fit: BoxFit.cover)
                    ),
                  );
                },
            ),
            SizedBox(
              width: width*0.05,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    article['title'],
                    style: Theme.of(context).textTheme.titleMedium,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    timeago.format(time),
                    style: Theme.of(context).textTheme.titleSmall,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DividerWidget extends StatelessWidget {
  const DividerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      color: Colors.grey[400],
      height: 2,
      width: double.infinity,
    );
  }
}
