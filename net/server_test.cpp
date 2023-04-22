#include <gtest/gtest.h>

#include "server.hpp"

TEST(ServerTest, ServerRunReturns) {
  Trade::Engine::Net::Server s;
  EXPECT_TRUE(s.Run() == 0);
}

int main(int argc, char **argv) {
  ::testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}
