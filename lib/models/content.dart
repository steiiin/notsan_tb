class Content {

  final String name;
  final List<String> altnames;
  final List<String> searchnames;

  const Content({

    required this.name,
    this.altnames = const [],
    this.searchnames = const [],

  });

  String getAltnamesJoined() {
    return altnames.isNotEmpty ? altnames.join(', ') : '';
  }

  String getSearchnamesJoined() {
    return searchnames.isNotEmpty ? searchnames.join(', ') : '';
  }

}
