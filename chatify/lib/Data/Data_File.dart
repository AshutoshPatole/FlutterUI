import '../CustomAvatars/OnlineAvatar.dart';
import '../CustomAvatars/ProfileAvatar.dart';
import 'package:flutter/material.dart';

class Data extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ProfileAvatar(
          link: 'https://www.randomlists.com/img/people/johnny_cash.webp',
          name: "James",
        ),
        ProfileAvatar(
          link: 'https://www.randomlists.com/img/people/mariska_hargitay.webp',
          name: "Anne",
        ),
        ProfileAvatar(
          link: 'https://www.randomlists.com/img/people/ellen_degeneres.webp',
          name: "Ellen",
        ),
        ProfileAvatar(
          link: 'https://www.randomlists.com/img/people/drew_barrymore.webp',
          name: "Emma",
        ),
      ],
    );
  }
}

class Data2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ProfileAvatar(
          link: 'https://www.randomlists.com/img/people/tom_hanks.webp',
          name: "Tom",
        ),
        ProfileAvatar(
          link:
              'https://www.randomlists.com/img/people/diana__princess_of_wales.webp',
          name: "Diana",
        ),
        ProfileAvatar(
          link: 'https://www.randomlists.com/img/people/dave_matthews.webp',
          name: "Daves",
        ),
        ProfileAvatar(
          link: 'https://www.randomlists.com/img/people/danielle_steel.webp',
          name: "Danielle",
        ),
      ],
    );
  }
}

class Online extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        OnlineAvatar(
          link: 'https://www.randomlists.com/img/people/tom_hanks.webp',
        ),
        OnlineAvatar(
          link:
              'https://www.randomlists.com/img/people/diana__princess_of_wales.webp',
        ),
        OnlineAvatar(
          link: 'https://www.randomlists.com/img/people/dave_matthews.webp',
        ),
        OnlineAvatar(
          link: 'https://www.randomlists.com/img/people/danielle_steel.webp',
        ),
      ],
    );
  }
}
