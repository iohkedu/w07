module W0702
    ( crowd
    ) where

import Marlowe

-- | Creates a Marlowe contract for a crowd-sourcing campaign.
-- The contributors have time before the deadline to deposit a (fixed) amount
-- into the campaign. If the campaign goal is reached when the deadline comes,
-- the campaign owner gets all the contributions. If not, the contributors get reimbursed.
--
crowd :: Amount   -- ^ campaign goal
      -> Amount   -- ^ individual contribution
      -> Role     -- ^ campaign owner
      -> [Role]   -- ^ contributors
      -> Slot     -- ^ deadline
      -> Contract
crowd = error "TODO: implement crowd"
