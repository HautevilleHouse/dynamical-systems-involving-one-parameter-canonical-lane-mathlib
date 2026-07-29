import DynamicalSystemsInvolvingOneParameterCanonicalLaneLean.FinalTheorem
import canonicalLaneMathlib.Core

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterCanonicalLaneLean

open HautevilleHouse.canonicalLaneMathlibCore

structure MathlibProofObligation where
  sourceKey : String
  theoremObject : String
  commonCoreImported : Bool
  theoremSpecificDefinitionsNative : Bool
  theoremSpecificBridgeNative : Bool
  theoremSpecificAdmittedClosureNative : Bool
  unrestrictedClassicalClosureNative : Bool
  carriedGap : String

def mathlibProofObligation : MathlibProofObligation := {
  sourceKey := sourceRepository
  theoremObject := sourceDescription
  commonCoreImported := true
  theoremSpecificDefinitionsNative := true
  theoremSpecificBridgeNative := true
  theoremSpecificAdmittedClosureNative := true
  unrestrictedClassicalClosureNative := false
  carriedGap := "theorem-specific endgame pilot closes over the admitted class; unrestricted classical closure remains carried"
}

theorem theorem_specific_endgame_pilot_checked :
    forall A : AdmissibleClass, ConstrainedDynamicalClosure A := by
  intro A
  exact constrained_dynamical_endgame A

end DynamicalSystemsInvolvingOneParameterCanonicalLaneLean
end HautevilleHouse
