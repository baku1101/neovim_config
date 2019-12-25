//include
//------------------------------------------
#include <bits/stdc++.h>
using namespace std;

//typedef
//------------------------------------------
typedef long long LL;
typedef vector<LL> VL;
typedef vector<VL> VVL;
typedef vector<string> VS;
typedef pair<LL, LL> PLL;

//container util
//------------------------------------------
#define ALL(a)  (a).begin(),(a).end()
#define RALL(a) (a).rbegin(), (a).rend()
#define SORT(c) sort((c).begin(),(c).end())
#define RSORT(c) sort((c).rbegin(),(c).rend())

//constant
//--------------------------------------------
const double EPS = 1e-10;
const double PI  = acos(-1.0);
const int MOD = 1000000007;

// grid
//--------------------------------------------
VL dx = {0, 1, 0, -1};
VL dy = {1, 0, -1, 0};
VL dx2 = {-1, 0, 1, -1, 1, -1, 0, 1};
VL dy2 = {-1, -1, -1, 0, 0, 1, 1, 1};

//debug
//--------------------------------------------
#define dump(x)  cerr << #x << " = " << (x) << endl
#define debug(x) cerr << #x << " = " << (x) << " (L" << __LINE__ << ")" << " " << __FILE__ << endl

//IO accelerate
//--------------------------------------------
struct InitIO {
    InitIO() {
        cin.tie(nullptr);
        ios_base::sync_with_stdio(false);
        cout << fixed << setprecision(30);
    }
} init_io;

//template
//--------------------------------------------
template<typename T>
istream& operator >>(istream& is, vector<T>& vec) {
  for(T& x: vec) is >> x;
  return is;
}
template<typename T>
ostream& operator <<(ostream& os, const vector<T>& vec) {
  for(int i=0; i<vec.size(); i++){
    os << vec[i] << ( i+1 == vec.size() ? "" : "\t" );
  }
  return os;
}
template<typename T>
ostream& operator <<(ostream& s, const vector<vector<T>>& vv) {
	for (int i = 0; i < vv.size(); ++i) {
		s << vv[i] << endl;
	}
	return s;
}
template<typename T>
ostream& operator <<(ostream& s, const vector<pair<T, T>>& vp) {
	for (int i = 0; i < vp.size(); ++i) {
		s << "(" << vp[i].first << "," << vp[i].second << ")" << ( i+1 == vp.size() ? "" : ",\t" );
	}
	return s;
}

// 多重vector
// auto dp=make_v<int>(4,h,w) みたいに使える
template<typename T>
vector<T> make_v(size_t a){return vector<T>(a);}

template<typename T,typename... Ts>
auto make_v(size_t a,Ts... ts){
  return vector<decltype(make_v<T>(ts...))>(a,make_v<T>(ts...));
}

// 多重vectorのためのfill
// fill_v(dp,0) みたいに使える
template<typename T,typename V>
typename enable_if<is_class<T>::value==0>::type
fill_v(T &t,const V &v){t=v;}

template<typename T,typename V>
typename enable_if<is_class<T>::value!=0>::type
fill_v(T &t,const V &v){
  for(auto &e:t) fill_v(e,v);
}

//main code

int main(int argc, char const* argv[])
{
	return 0;
}
