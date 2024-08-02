

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_games/domain/entities/creator.dart';
import 'package:smart_games/presentation/providers/creators/creators_provider.dart';
import 'package:smart_games/presentation/widgets/creator_card.dart';

class CreatorsScreen extends ConsumerStatefulWidget {
  const CreatorsScreen({super.key});

  @override
  CreatorsScreenState createState() => CreatorsScreenState();
}

class CreatorsScreenState extends ConsumerState<CreatorsScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(creatorsProvider.notifier).getCreators();
  }
  
  @override
  Widget build(BuildContext context) {
    final List<Creator> creators = ref.watch(creatorsProvider);

    return CupertinoPageScaffold(
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          const CupertinoSliverNavigationBar(
            heroTag: 'creators',
            largeTitle: Text('Creators', style: TextStyle(color: Colors.white),),
          ),
        ],
        body: CustomScrollView(
          slivers: [

            SliverGrid.builder(
              
              itemCount: creators.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent( 
              mainAxisSpacing: 5,
              crossAxisSpacing: 20,
              maxCrossAxisExtent: MediaQuery.sizeOf(context).width / 2,
              childAspectRatio: 0.7
            ), 
              itemBuilder: (context, index) {
              final Creator creator = creators[index];
                return FadeInUp(
                  child: GestureDetector(
                    onTap: () => context.push('/creators/${creator.id}'),
                    child: CreatorCard(creator: creator)
                  ),
                );
                },),
          ],
        )
      )
    );


  }
}