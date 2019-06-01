import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:flutter_advanced_networkimage/transition.dart';

class RoundedImage extends StatelessWidget {
  RoundedImage({Key key, this.photoUrl}) : super(key: key);
  final String photoUrl;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0.0, 3.0),
                      blurRadius: 10.0)
                ],
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: TransitionToImage(
                transitionType: TransitionType.slide,
                image: AdvancedNetworkImage(
                  photoUrl,
                  useDiskCache: true,
                  cacheRule: CacheRule(maxAge: const Duration(days: 5)),
                ),
                placeholder: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator()),
                duration:  Duration(microseconds:500 ),
                fit: BoxFit.cover,
              ),
            ),
              ),
        ),
      ],
    );
  }
}
