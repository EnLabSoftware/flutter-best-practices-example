// SHOULD: Use small widgets

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF1F4),
      body: ListView(
        children: [
          buildSectionTitle('Categories'),
          QuickNavigation(/*Inject services*/),

          UserStatusAndPoint(/*Inject services*/),

          buildSectionTitle('Your coupons'),
          Coupons(/*Inject services*/),

          buildSectionTitle('Suggested foods'),
          FoodSuggestion(/*Inject services*/),

          buildSectionTitle('Explore'),
          Explore(/*Inject services*/),

          // Other widgets
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
}

class Explore extends StatelessWidget {
  Explore({
    Key? key,
  }) : super(key: key);

  // Call API
  final List<ExploreDrink> exploreDrinks =
      List<ExploreDrink>.generate(6, (index) => ExploreDrink());

  // Other self-managed methods

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: exploreDrinks.map((e) => exploreItem).toList(),
    );
  }

  Container get exploreItem => Container(
        width: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
      );
}

class FoodSuggestion extends StatelessWidget {
  FoodSuggestion({
    Key? key,
  }) : super(key: key);

  // Call API
  final List<SuggestedFood> suggestedFoods =
      List<SuggestedFood>.generate(5, (index) => SuggestedFood());

  // Other self-managed methods

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        itemCount: suggestedFoods.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => foodItem,
        separatorBuilder: (context, index) => SizedBox(width: 10),
      ),
    );
  }

  Container get foodItem => Container(
        width: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
      );
}

class Coupons extends StatelessWidget {
  Coupons({
    Key? key,
  }) : super(key: key);

  // Call API
  final List<Coupon> coupons = List<Coupon>.generate(5, (index) => Coupon());

  // Other self-managed methods

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        itemCount: coupons.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => couponItem,
        separatorBuilder: (context, index) => SizedBox(width: 10),
      ),
    );
  }

  Container get couponItem => Container(
        width: 180,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
      );
}

class UserStatusAndPoint extends StatelessWidget {
  const UserStatusAndPoint({
    Key? key,
  }) : super(key: key);

  // Other self-managed methods

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.fromLTRB(18, 28, 18, 0),
      decoration: BoxDecoration(
        // color: Colors.white,
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
    );
  }
}

class QuickNavigation extends StatelessWidget {
  QuickNavigation({
    Key? key,
  }) : super(key: key);

  // Call API
  final List<Category> categories =
      List<Category>.generate(5, (index) => Category());

  // Other self-managed methods

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        separatorBuilder: (context, index) => SizedBox(width: 10),
        itemBuilder: (context, index) => categoryItem,
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
      ),
    );
  }

  Container get categoryItem => Container(
        width: 80,
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
