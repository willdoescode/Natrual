import Test.HUnit

data Nat = Z | S Nat deriving (Eq)

natToInt :: Nat -> Int
natToInt Z = 0
natToInt (S k) = 1 + natToInt k

instance Show Nat where
  show = show . natToInt

instance Num Nat where
  fromInteger 0 = Z
  fromInteger n = S $ fromInteger $ n - 1

  (+) n Z = n
  (+) a (S k) = S $ a + k

  (*) Z n = Z
  (*) n (S k) = k * n + n

  abs _ = Z
  signum _ = Z
  (-) _ _ = Z

testAddNat :: Test
testAddNat =
  TestCase $
    assertEqual
      "Nats should add correctly"
      (S (S (S (S (S (S (S (S (S Z)))))))))
      ((4 :: Nat) + (5 :: Nat))

testMultNat :: Test
testMultNat =
  TestCase $
    assertEqual
      "Nats should multiply correctly"
      (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S Z))))))))))))))))))))
      ((4 :: Nat) * (5 :: Nat))

testShowNat :: Test
testShowNat =
  TestCase $
    assertEqual
      "Nat should convert to string correctly"
      "5"
      (show (S (S (S (S (S Z))))))

testOrderOfOperations :: Test
testOrderOfOperations =
  TestCase $
    assertEqual
      "Nats should add and multiply in the correct direction"
      (S (S (S (S (S (S (S (S Z))))))))
      ((2 :: Nat) * (3 :: Nat) + (2 :: Nat))

main :: IO Counts
main = runTestTT $ TestList [testAddNat, testMultNat, testShowNat, testOrderOfOperations]
