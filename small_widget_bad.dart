// BAD: a long nested widget example

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // Call API
  List<Category> categories = List<Category>.generate(5, (index) => Category());

  // Call API
  List<SuggestedFood> suggestedFoods =
      List<SuggestedFood>.generate(5, (index) => SuggestedFood());

  // Call API
  List<ExploreDrink> exploreDrinks =
      List<ExploreDrink>.generate(6, (index) => ExploreDrink());

  // Call API
  List<Coupon> coupons = List<Coupon>.generate(5, (index) => Coupon());

  void handleQuickNavigationEvent() {}
  void handleUserStatusAndPointEvent() {}
  void handleCouponsEvent() {}
  void handleSuggestedFoodsEvent() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF1F4),
      body: ListView(
        children: [
          // Quick navigation to category
          buildSectionTitle('Categories'),
          Container(
            height: 80,
            width: double.infinity,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              separatorBuilder: (context, index) => SizedBox(width: 10),
              itemBuilder: (context, index) => categoryItem,
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
            ),
          ),

          // User status and point
          Container(
            height: 80,
            margin: const EdgeInsets.fromLTRB(18, 28, 18, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              children: [
                //...
                Expanded(
                  child: Container(
                    height: 80,
                    child: Center(child: Text('Status')),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  flex: 1,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: 80,
                    child: Center(child: Text('Point')),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  flex: 2,
                ),
              ],
            ),
          ),

          // Your coupons
          buildSectionTitle('Your coupons'),
          SizedBox(
            height: 120,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              itemCount: coupons.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => couponItem,
              separatorBuilder: (context, index) => SizedBox(width: 10),
            ),
          ),

          // Suggested foods
          buildSectionTitle('Suggested foods'),
          SizedBox(
            height: 120,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              itemCount: suggestedFoods.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => foodItem,
              separatorBuilder: (context, index) => SizedBox(width: 10),
            ),
          ),

          // Explore
          buildSectionTitle('Explore'),
          GridView.count(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: exploreDrinks.map((e) => exploreItem).toList(),
          ),
          // Offer you may like
        ],
      ),
    );
  }

  Padding buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 28, 18, 18),
      child: Text(title, style: TextStyle(fontSize: 18)),
    );
  }

  Container get categoryItem => Container(
        width: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
      );

  Container get foodItem => Container(
        width: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
      );

  Container get couponItem => Container(
        width: 180,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
      );

  Container get exploreItem => Container(
        width: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
      );
}

class Category {}

class ExploreDrink {}

class SuggestedFood {}

class Coupon {}
