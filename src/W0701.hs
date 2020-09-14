module W0701
    ( ex1, ex2, ex3, undefinedValueIds
    ) where

import Data.Set (Set)
import Marlowe

ex1 :: Contract
ex1 = Pay "alice" (Party "bob") (UseValue $ ValueId "x") ada Close

ex2 :: Contract
ex2 = Let (ValueId "x") (ChoiceValue $ ChoiceId "c" "alice") ex1

ex3 :: Contract
ex3 = When
        [ Case (Deposit "alice" "alice" (Constant 100) ada) $
            Let v (AvailableMoney "alice" ada) $
                Pay "alice" (Party "bob") (SubValue (UseValue v) (UseValue w)) ada Close ]
        (Slot 25)
        (Pay "alice" (Account "bob") (UseValue v) ada Close)
  where
    v, w :: ValueId
    v = ValueId "v"
    w = ValueId "w"

-- | Detects uninitialized 'ValueId'\'s
-- which have not been set to a `Value`
-- for the given contract.
--
-- >>> undefinedValueIds ex1
-- fromList [ValueId "x"]
--
-- >>> undefinedValueIds ex2
-- fromList []
--
-- >>> undefinedValueIds ex3
-- fromList [ValueId "v",ValueId "w"]
--
undefinedValueIds :: Contract -> Set ValueId
undefinedValueIds = error "TODO: implement undefinedValueIds"
