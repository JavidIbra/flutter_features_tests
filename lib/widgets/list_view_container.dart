import 'package:flutter/material.dart';
import 'package:flutter_features_tests/models/post.dart';
import 'package:flutter_features_tests/notifiers/list_view_state.dart';
import 'package:flutter_features_tests/widgets/service_locator.dart';

class ListViewContainer extends StatelessWidget {
  const ListViewContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final state = getIt.get<ListViewState>();

    return Expanded(
      child: ValueListenableBuilder<List<Post>>(
        valueListenable: state.postsNotifier,
        builder: (context, snapshot, child) {
          return ListView(
            children: snapshot
                .map(
                  (post) => ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.body),
                    leading: CircleAvatar(
                      child: Text(
                        post.id.toString(),
                      ),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          state.postRemoveTapped(post);
                        },
                        icon: const Icon(Icons.remove_circle_outline)),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
