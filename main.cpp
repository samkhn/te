#include <iostream>

#include "net/server.hpp"

int main() {
  Trade::Engine::Net::Server s;
  return s.Run();
}
