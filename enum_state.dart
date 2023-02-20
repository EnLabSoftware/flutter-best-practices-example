import 'package:flutter/material.dart';

enum ContentState { loading, loaded, empty, error }

class StoryView extends StatefulWidget {
  const StoryView({Key? key}) : super(key: key);

  @override
  State<StoryView> createState() => _StoryViewState();
}

class _StoryViewState extends State<StoryView> {
  ContentState contentState = ContentState.loading;
  List<Story>? stories;

  Future<void> _loadData() async {
    try {
      _setLoading();
      final result = await getStories();

      if (result.isEmpty) {
        _setEmpty();
      } else {
        stories = result;
        _setLoaded();
      }
    } catch (e) {
      // Handle error
      _setError();
    }
  }

  Future<List<Story>> getStories() {
    // Handle get list of story
    return Future.value(List<Story>.generate(2, (index) => Story()));
  }

  void _setError() {
    setState(() {
      contentState = ContentState.error;
    });
  }

  void _setLoaded() {
    setState(() {
      contentState = ContentState.loaded;
    });
  }

  void _setEmpty() {
    setState(() {
      contentState = ContentState.empty;
    });
  }

  void _setLoading() {
    setState(() {
      contentState = ContentState.loading;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: () {
        switch (contentState) {
          case ContentState.loaded:
            return buildContent(stories!);
          case ContentState.loading:
            return loadingView;
          case ContentState.error:
            return errorView;
          case ContentState.empty:
          default:
            return emptyView;
        }
      }(),
    );
  }

	Widget buildContent(List<Story> data) => const Center(child: Text('Content'));

  Widget get loadingView => const Center(child: CircularProgressIndicator.adaptive());

  Widget get errorView => const Center(child: Text('Error'));

  Widget get emptyView => const Center(child: Text('Empty'));
}

class Story {
  late final String id;
  late final String url;
}