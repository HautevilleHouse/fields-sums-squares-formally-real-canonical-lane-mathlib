import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FieldsSumsSquaresFormallyRealCanonicalLaneLean

structure TarskiTransfer where
  realClosedField : Prop
  quantifierElimination : Prop
  transferPrinciple : Prop

structure TarskiTransferEvidence (T : TarskiTransfer) where
  realClosedFieldClosed : T.realClosedField
  quantifierEliminationClosed : T.quantifierElimination
  transferPrincipleClosed : T.transferPrinciple

def TarskiTransferClosed (T : TarskiTransfer) : Prop :=
  T.realClosedField ∧ T.quantifierElimination ∧ T.transferPrinciple

theorem tarski_transfer_closed_from_evidence (T : TarskiTransfer)
    (E : TarskiTransferEvidence T) : TarskiTransferClosed T := by
  exact And.intro E.realClosedFieldClosed
    (And.intro E.quantifierEliminationClosed E.transferPrincipleClosed)

end FieldsSumsSquaresFormallyRealCanonicalLaneLean
end HautevilleHouse