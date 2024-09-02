import { createFileRoute } from '@tanstack/react-router'
import { useForm } from '@tanstack/react-form'
import { useMutation, useQueryClient } from '@tanstack/react-query'
import {
  FormControl,
  FormLabel,
  FormErrorMessage,
  FormHelperText,
  Input, 
} from '@chakra-ui/react'
import { createBenefit } from '../../api/index'

export const Route = createFileRoute('/benefits/new')({
  component: NewBenefit,
})

export function NewBenefit() {
  const queryClient = useQueryClient()

  const mutation = useMutation({
      mutationFn: createBenefit,
      onSuccess: () => {
        // Invalidate and refetch
        queryClient.invalidateQueries({ queryKey: ['benefits'] })
      },
    })
    
  const form = useForm({
      defaultValues: {
        description: '',
        weight: '',
        analysisId: ''
      },
      onSubmit: async ({ value }) => {
        // Do something with form data
        console.log(value)
        mutation.mutate({
          description: value.description,
          weight: Number(value.weight),
          analysis_id: 2
        })
      },
  })

  return (
      <form
        onSubmit={(e) => {
          e.preventDefault();
          e.stopPropagation();
          form.handleSubmit();
        }}
      >
        <form.Field
          name="description"
          children={(field) => (
            <FormControl>
              <FormLabel>Description</FormLabel>
              <Input
                name={field.name}
                value={field.state.value}
                onBlur={field.handleBlur}
                onChange={(e) => field.handleChange(e.target.value)}
              />
            </FormControl>
          )}
        />
        <form.Field
          name="weight"
          children={(field) => (
            <FormControl>
              <FormLabel>Weight</FormLabel>
              <Input
                name={field.name}
                value={field.state.value}
                onBlur={field.handleBlur}
                onChange={(e) => field.handleChange(e.target.value)}
              />
              <FormHelperText>How important is this from a 1 - 10 scale with 10 being the most important</FormHelperText>
            </FormControl>
          )}
        />
        <button type="submit">Submit</button>
      </form>
  )
}
