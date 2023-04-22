#ifndef TRADE_ENGINE_NET_SERVER_HPP
#define TRADE_ENGINE_NET_SERVER_HPP

namespace Trade {
namespace Engine {
namespace Net {

class Server {
 public:
  Server() : r_(0) {}
  int Run();

 private:
  int r_;
};

};  // namespace Net
};  // namespace Engine
};  // namespace Trade

#endif  // TRADE_ENGINE_NET_SERVER_HPP
