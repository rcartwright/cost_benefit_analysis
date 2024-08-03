import React from 'react'
import ReactDOM from 'react-dom/client'
import { createFileRoute } from '@tanstack/react-router'
import { useForm } from '@tanstack/react-form'
import { useMutation, useQueryClient } from '@tanstack/react-query'
import { createBenefit } from '../../api/index'

export const Route = createFileRoute('/benefits/new')({
  component: NewBenefit,
})


function NewBenefit() {
  const queryClient = useQueryClient()

  const mutation = useMutation({
      mutationFn: createBenefit,
      onSuccess: () => {
        // Invalidate and refetch
        queryClient.invalidateQueries({ queryKey: ['todos'] })
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
    <div>
        <form
          onSubmit={(e) => {
            e.preventDefault();
            e.stopPropagation();
            form.handleSubmit();
          }}
        >
          <div>
            <form.Field
              name="description"
              children={(field) => (
                <input
                  name={field.name}
                  value={field.state.value}
                  onBlur={field.handleBlur}
                  onChange={(e) => field.handleChange(e.target.value)}
                />
              )}
            />
            <form.Field
              name="weight"
              children={(field) => (
                <input
                  name={field.name}
                  value={field.state.value}
                  onBlur={field.handleBlur}
                  onChange={(e) => field.handleChange(e.target.value)}
                />
              )}
            />
          </div>
          <button type="submit">Submit</button>
        </form>
    </div>
  )
}
