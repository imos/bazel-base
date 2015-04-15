#include "example/hello-world.h"
#include "third_party/gtest/gtest.h"

class HelloWorldTest : public testing::Test {};

TEST_F(HelloWorldTest, HelloWorld) {
  EXPECT_TRUE(HelloWorld());
}
