import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_games/domain/entities/store.dart';
import 'package:smart_games/presentation/providers/stores/stores_provider.dart';
import 'package:smart_games/presentation/widgets/games_list.dart';

class StoresScreen extends ConsumerStatefulWidget {
  const StoresScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StoresScreenState();
}

class _StoresScreenState extends ConsumerState<StoresScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(storesProvider.notifier).getStores();
    
  }

  @override
  Widget build(BuildContext context) {
    final List<Store> stores = ref.watch(storesProvider);
    final textStyles = Theme.of(context).textTheme;
    final themeColors = Theme.of(context).colorScheme;

    return CupertinoPageScaffold(
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          const CupertinoSliverNavigationBar(
            heroTag: 'stores',
            largeTitle: Text('Stores', style: TextStyle(color: Colors.white),),
          ),
        ],
        body: CustomScrollView(
          slivers: [

            SliverList.builder(
              itemCount: stores.length,
              itemBuilder: (context, index) {
              final Store store = stores[index];
                return Container(
                  child: FadeInUp(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () => context.push('/stores/${store.id}'),
                            child: Image.network(
                              store.imageBackground ?? 'https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg',        
                              fit: BoxFit.cover,
                              loadingBuilder: (context, child, loadingProgress) {
                                if(loadingProgress != null) {
                                  return const DecoratedBox(
                                    decoration: BoxDecoration(color: Colors.black12),
                                  );
                                }
                                
                                return FadeIn(child: child);
                              },
                            ),
                          ),
                    
                          Text(store.name, style: textStyles.titleLarge!.copyWith(color: themeColors.primary),),
                    
                          if(store.games != null)
                            GamesList(games: store.games!),
                        
                          const SizedBox(height: 40,)
                        ],
                      ),
                    ),
                  ),
                );
                },),
          ],
        )
      )
    );
  }
}