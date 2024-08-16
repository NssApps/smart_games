
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_games/config/helpers/html_remover.dart';
import 'package:smart_games/domain/entities/store.dart';
import 'package:smart_games/presentation/providers/stores/store_provider.dart';
import 'package:smart_games/presentation/providers/stores/stores_provider.dart';
import 'package:smart_games/presentation/widgets/custom_sliver_appbar.dart';

class ShowStoreScreen extends ConsumerStatefulWidget {
  final String storeId;

  const ShowStoreScreen( {super.key, required this.storeId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ShowStoreScreenState();
}

class _ShowStoreScreenState extends ConsumerState<ShowStoreScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(storeProvider.notifier).getStore(widget.storeId);
    
  }

  @override
  Widget build(BuildContext context) {
    final Store? store = ref.watch(storeProvider).store;
    final textStyles = Theme.of(context).textTheme;
    final themeColors = Theme.of(context).colorScheme;

    return Scaffold(
      body: store == null ?
        const Center(child: CircularProgressIndicator(),)
        :
      CustomScrollView(
        slivers: [
          CustomSliverAppbar(
              title: store.name ?? 'Name not available', 
            background: Image.network(store.imageBackground, fit: BoxFit.cover,),
            customWidget: SizedBox(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow.shade800,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
          
                ],
              ),
            ),
          ),


          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10,),
                  Text('About ${store.name}', style: textStyles.titleLarge!.copyWith(color: themeColors.primary),),
                  const SizedBox(height: 5,),
                  Text(HtmlRemover.removeHtmlTags(store.description ?? 'Description not available') ),
                  const SizedBox(height: 10,),
                  TextButton.icon(
                    onPressed: () => context.push('/webViewer/${store.domain}/${store.name}'), 
                    icon: const Icon(Icons.link),
                    label: Text('${store.domain}', style: textStyles.titleSmall!.copyWith(color: themeColors.primary),)
                  ),
                
                  const SizedBox(height: 40,),
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}