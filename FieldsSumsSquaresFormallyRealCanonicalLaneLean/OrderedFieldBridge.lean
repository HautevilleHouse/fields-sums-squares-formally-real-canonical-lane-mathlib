import FieldsSumsSquaresFormallyRealCanonicalLaneLean.SumOfSquares

namespace HautevilleHouse
namespace FieldsSumsSquaresFormallyRealCanonicalLaneLean

structure OrderedFieldBridge where
  field : FormallyRealField
  totalOrder : Prop
  positiveConeMatchesSquares : Prop
  positiveConeMatchesSquaresClosed : positiveConeMatchesSquares
  totalOrderClosed : totalOrder

structure OrderedFieldEvidence (O : OrderedFieldBridge) where
  totalOrderClosed : O.totalOrder
  positiveConeMatchesSquaresClosed : O.positiveConeMatchesSquares

def OrderedFieldClosed (O : OrderedFieldBridge) : Prop :=
  O.totalOrder ∧ O.positiveConeMatchesSquares

theorem ordered_field_closed_from_evidence (O : OrderedFieldBridge)
    (E : OrderedFieldEvidence O) : OrderedFieldClosed O := by
  exact And.intro E.totalOrderClosed E.positiveConeMatchesSquaresClosed

end FieldsSumsSquaresFormallyRealCanonicalLaneLean
end HautevilleHouse