import Test.HUnit

data Nat = Z | S Nat deriving (Eq)

instance Show Nat where
  show = show . natToInt

natToInt :: Nat -> Int
natToInt Z = 0
natToInt (S k) = 1 + natToInt k

intToNat :: Integer -> Nat
intToNat 0 = Z
intToNat x = S (intToNat (x - 1))

e :: Nat -> Bool
e Z = True
e (S k) = o k
  where
    o :: Nat -> Bool
    o Z = False
    o (S k) = e k

-- instance Enum Nat

-- instance Eq Nat

-- instance Ord Nat

-- instance Real Nat

-- instance Integral Nat

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
testAddNat = TestCase $ assertEqual "Nats should add correctly" (S (S (S (S (S (S (S (S (S Z))))))))) ((4 :: Nat) + (5 :: Nat))

testMultNat :: Test
testMultNat = TestCase $ assertEqual "Nats should multiply correctly" (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S Z)))))))))))))))))))) ((4 :: Nat) * (5 :: Nat))

testShowNat :: Test
testShowNat = TestCase $ assertEqual "Nat should convert to string correctly" "5" (show (S (S (S (S (S Z))))))

main :: IO Counts
main = runTestTT $ TestList [testAddNat, testMultNat, testShowNat]
