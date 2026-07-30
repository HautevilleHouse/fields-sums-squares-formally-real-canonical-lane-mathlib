import FieldsSumsSquaresFormallyRealCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace FieldsSumsSquaresFormallyRealCanonicalLaneLean

structure FormallyRealField where
  carrier : Type
  ringStructure : Ring carrier
  formallyReal : Prop
  positiveConeDefined : Prop
  sumOfSquaresPositive : Prop
  conclusion : sumOfSquaresPositive

def FieldWitnessClosed (F : FormallyRealField) : Prop :=
  F.sumOfSquaresPositive

end FieldsSumsSquaresFormallyRealCanonicalLaneLean
end HautevilleHouse